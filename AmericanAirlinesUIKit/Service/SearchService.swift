//
//  SearchDataService.swift
//  AmericanAirlinesUIKit
//
//  Created by William Rozier on 9/22/23.
//

import Foundation


struct SearchResponse: Decodable {
    let relatedTopics: [RelatedTopic]?
    
    enum CodingKeys: String, CodingKey {
        case relatedTopics = "RelatedTopics"
    }
}

struct RelatedTopic: Decodable {
    let text: String
    let firstURL: String
}

class SearchService {
    static let shared = SearchService()
    
    init() {} // Ensure only one instance is created
    
    func fetchSearchResult(for query: String, completion: @escaping (Result<SearchResult, Error>) -> Void) {
        guard let apiUrl = URL(string: "https://api.duckduckgo.com/?q=\(query)&format=json&pretty=1") else {
            completion(.failure(NetworkError.invalidUrl))
            return
        }

        URLSession.shared.dataTask(with: apiUrl) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let searchResult = try decoder.decode(SearchResult.self, from: data)
                completion(.success(searchResult))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    func fetchRelatedTopics(for query: String, completion: @escaping (Result<[RelatedTopic], Error>) -> Void) {
        // Construct your API URL for related topics here
        guard let apiUrl = URL(string: "https://api.duckduckgo.com/?q=\(query)&format=json&pretty=1") else {
            completion(.failure(NetworkError.invalidUrl))
            return
        }

        // Create a data task for the API request
        URLSession.shared.dataTask(with: apiUrl) { (data, response, error) in
            if let error = error {
                completion(.failure(error)) // Return the error directly
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let searchResponse = try decoder.decode(SearchResponse.self, from: data)
                if let relatedTopics = searchResponse.relatedTopics {
                    completion(.success(relatedTopics))
                } else {
                    completion(.success([]))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    enum NetworkError: Error {
        case invalidUrl
        case noData
        case failure(Error)
    }
}
