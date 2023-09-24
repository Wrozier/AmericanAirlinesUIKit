//
//  SearchViewModel.swift
//  AmericanAirlinesUIKit
//
//  Created by William Rozier on 9/23/23.
//

import Foundation
import UIKit



class SearchViewModel {
    
    let networkManager = SearchService()
    var searchResults: [SearchResult] = []

    func fetchData(for searchTerm: String, completion: @escaping (Error?) -> Void) {
            networkManager.fetchSearchResult(for: searchTerm) { [weak self] result in
                switch result {
                case .success(let search):
                    self?.searchResults = [search]
                    completion(nil)
                case .failure(let error):
                    completion(error)
                }
            }
        }
    }
    





//class SearchViewModel {
//    private let networkManager = SearchDataService() // Replace with your actual network manager
//
//    var searchResults: [Result] = [] // Use the type you defined for a single search result
//
//    func fetchData(for searchTerm: String, completion: @escaping (Error?) -> Void) {
//        networkManager.fetchData(for: searchTerm) { [weak self] result in
//            switch result {
//            case .success(let searchResponse):
//                self?.searchResults = searchResponse.results
//                completion(nil)
//            case .failure(let error):
//                completion(error)
//            }
//        }
//    }
//}
