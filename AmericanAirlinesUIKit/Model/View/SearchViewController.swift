//
//  ViewController.swift
//  AmericanAirlinesUIKit
//
//  Created by William Rozier on 9/22/23.
//

import UIKit

class SearchResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
  
    private var viewModel = SearchViewModel()
    var searchResults: [SearchResult] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + searchResults.count
    }
  
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Check if the indexPath is within the range of searchResults
        if indexPath.row < searchResults.count {
            let searchResult = searchResults[indexPath.row]
            cell.textLabel?.text = searchResult.abstract // You can use any property from your SearchResult model here
        } else {
            cell.textLabel?.text = "No data available"
        }
        
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchTerm = searchController.searchBar.text, !searchTerm.isEmpty {
            viewModel.fetchSearchResultData(for: searchTerm)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    
  

    
    // MARK: - Properties
    
    var searchResult: SearchResult? // This will hold the search result data
    
    
    // MARK: - Outlets
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var abstractLabel: UILabel!
    @IBOutlet private weak var definitionLabel: UILabel!
    @IBOutlet private weak var entityLabel: UILabel!
  //  @IBOutlet private weak var searchBar: UISearchBar!
    
    // MARK: - View Lifecycle
    var searchController: UISearchController!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        tableView.delegate = self
        tableView.dataSource = self
        //searchBar.delegate = self
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    // MARK: - UI Setup
    
    func configureUI() {
        // Checking to see if searchResult is not nil
        if let result = searchResult {
            titleLabel.text = result.heading
            abstractLabel.text = result.abstract
            definitionLabel.text = result.definition
            entityLabel.text = result.entity
          
            // Configure related topics, assuming you have a UITableView for them
            
            tableView.reloadData() // Reload the table view with related topics data
        } else {
            // Handle the case where searchResult is nil or data is missing
            titleLabel.text = "Results"
            abstractLabel.text = "Result Topics"
           // definitionLabel.text = ""
            //entityLabel.text = "no Label shown"
        }
    }
}
