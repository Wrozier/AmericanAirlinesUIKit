//
//  ViewController.swift
//  AmericanAirlinesUIKit
//
//  Created by William Rozier on 9/22/23.
//

import UIKit

class SearchResultViewController: UIViewController, UITableViewDelegate, UISearchBarDelegate{
    
    
    // MARK: - Outlets
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var titleLabel: UILabel!
    //@IBOutlet private weak var abstractLabel: UILabel!
    // Define outlets for other UI elements if needed


    
    // MARK: - Properties
    private var viewModel = SearchViewModel()
    var searchResults: [SearchResult] = []
    var searchResult: SearchResult?
    var searchController: UISearchController!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        tableView.delegate = self
        // tableView.dataSource = self
        //searchBar.delegate = self
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
    // MARK: - UI Setup
    
    private func configureUI() {
        if let result = searchResult {
            titleLabel.text = result.heading
           // abstractLabel.text = result.abstractText
            // Update other UI elements with relevant data from the SearchResult
            // definitionLabel.text = result.definition
            // entityLabel.text = result.entity

            tableView.reloadData()
        } else {
            titleLabel.text = "Results"
            //abstractLabel.text = "Result Topics"
            // definitionLabel.text = ""
            // entityLabel.text = "no Label shown"
        }
    }

    
}
 
    extension SearchResultViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1 + searchResults.count
            
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
            // Check if the indexPath is within the range of searchResults
            if indexPath.row < searchResults.count {
                let searchResults = searchResults[indexPath.row]
                cell.textLabel?.text = searchResults.abstractText // You can use any property from your SearchResult model here
            } else {
                cell.textLabel?.text = "No data available"
            }
            
            return cell
        }
    }
extension SearchResultViewController: UISearchResultsUpdating {
        func updateSearchResults(for searchController: UISearchController) {
            if let searchTerm = searchController.searchBar.text,
               !searchTerm.isEmpty {
                
                viewModel.searchKeyword = searchTerm

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

