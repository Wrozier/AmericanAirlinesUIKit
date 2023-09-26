//
//  SearchViewModel.swift
//  AmericanAirlinesUIKit
//
//  Created by William Rozier on 9/23/23.
//

import Foundation
import UIKit
import Combine

class SearchViewModel:ObservableObject {
    
    let networkManager = SearchService.shared
    //var networkManager = SearchService()
    var searchResults: [SearchResult] = []
    var relatedTopics: [RelatedTopic] = [] // Store related topics here
    
    // Add a completion handler property
    var onSearchResultUpdated: (() -> Void)?
    var onRelatedTopicsUpdated: (() -> Void)?
    
    private var anyCancalable: AnyCancellable?
    @Published var searchKeyword: String = ""
    
    init() {
        
       subcriberToSearch()
    }

    
    func fetchSearchResultData(for searchTerm: String) {
        networkManager.fetchSearchResult(for: searchTerm) { [weak self] (result: Result<SearchResult, Error>) in
            switch result {
            case .success(let searchResult):
                // Update the searchResult property with the fetched data
                self?.searchResults = [searchResult] // Assuming you want to update with a single result
                
                // Notify the view controller that the data has been updated on the main thread
                DispatchQueue.main.async {
                    self?.onSearchResultUpdated?()
                }
                
            case .failure(let error):
                // Handle the error gracefully, for example, show an alert to the user
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    func subcriberToSearch(){
        anyCancalable = $searchKeyword.debounce(for:0.5 , scheduler: DispatchQueue.global()).sink { value in
            print (value)
        }
    }
}
