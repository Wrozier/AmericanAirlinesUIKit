//
//  ViewController.swift
//  AmericanAirlinesUIKit
//
//  Created by William Rozier on 9/22/23.
//

import UIKit


class SearchResultViewController: UIViewController {
    
    // MARK: - Properties
    
    var searchResult: SearchResult? // This will hold the search result data
    var networkManager = SearchService()
    
    // MARK: - Outlets
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var abstractLabel: UILabel!
    @IBOutlet private weak var definitionLabel: UILabel!
    @IBOutlet private weak var entityLabel: UILabel!
    @IBOutlet private weak var searchBar: UISearchBar! 
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Actions
    
    @IBAction private func searchButtonTapped(_ sender: UIButton) {
        if let searchTerm = searchBar.text {
            fetchSearchResultData(for: searchTerm)
        }
    }
    
    // MARK: - UI Setup
    
    func configureUI() {
        // Check if searchResult is not nil
        if let result = searchResult {
            titleLabel.text = result.heading
            abstractLabel.text = result.abstract
            definitionLabel.text = result.definition
            entityLabel.text = result.entity
            // Configure other UI elements with relevant data
        } else {
            // Handle the case where searchResult is nil or data is missing
        }
    }
    
    // MARK: - Fetch Search Result Data
    
    func fetchSearchResultData(for searchTerm: String) {
        // Call your network manager to fetch data here
        networkManager.fetchSearchResult(for: searchTerm) { [weak self] result in
            switch result {
            case .success(let searchResults):
                // Update the searchResult property with the fetched data
                self?.searchResult = searchResults
                DispatchQueue.main.async {
                    // Update the UI with the fetched data, for example, reload the table view
                    self?.tableView.reloadData() // Make sure you have a tableView property
                }
            case .failure(let error):
                // Handle the error gracefully, for example, show an alert to the user
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
