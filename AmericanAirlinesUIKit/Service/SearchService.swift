//
//  SearchDataService.swift
//  AmericanAirlinesUIKit
//
//  Created by William Rozier on 9/22/23.
//

import Foundation


// MARK: - SearchService

import Foundation

class SearchService {
    
    // static let networkManager = SearchService()
    static let shared = SearchService()
    
    private init() { } 
    
    func fetchSearchResult(for query: String, completion: @escaping (Result<SearchResult, Error>) -> Void) {
        guard let apiUrl = URL(string: "https://api.duckduckgo.com/?q=American+Airlines&format=json&pretty=1") else {
            completion(.failure(SearchError.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: apiUrl) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(SearchError.noResultsFound))
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
}



    
  
