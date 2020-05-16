//
//  RepositoriesTableViewController.swift
//  GitHubApp
//
//  Created by Nikola on 06/05/2020.
//

import UIKit
import MBProgressHUD

class RepositoriesTableViewController: UITableViewController {
    
    var configurator = RepositoriesConfiguratorImplementation()
    var presenter: RepositoriesPresenter!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configurator.configure(repositorysTableViewController: self)
        presenter.viewDidLoad()
        
        // Search config
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.scopeButtonTitles = presenter.repositorySortKeys
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.router.prepare(for: segue, sender: sender)
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRepositories
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryTableViewCell", for: indexPath) as! RepositoryTableViewCell
        presenter.configure(cell: cell, forRow: indexPath.row)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.defaultCellHeight
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(row: indexPath.row)
    }
}

// MARK: - UISearchBarDelegate
extension RepositoriesTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter.getRepositories(query: searchBar.text ?? "", sort: "stars", sortOrder: "desc")
        searchController.searchBar.selectedScopeButtonIndex = 0
    }
    
    func searchBar(_ searchBar: UISearchBar,
                   selectedScopeButtonIndexDidChange selectedScope: Int) {
        presenter.sortRepositories(sort: presenter.repositorySortKeys[selectedScope])
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter.getRepositories(query: nil, sort: nil, sortOrder: nil)
        searchController.searchBar.selectedScopeButtonIndex = 0
    }
}

// MARK: - RepositoriesView
extension RepositoriesTableViewController: RepositoriesView {
    
    func display(screenTitle: String) {
        self.title = screenTitle
    }
    
    func refreshRepositoriesView() {
        tableView.reloadData()
    }
    
    func displayRepositoriesRetrievalError(title: String, message: String) {
        presentAlert(withTitle: title, message: nil)
    }
    
    func showLoader() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func hideLoader() {
        DispatchQueue.main.async() {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
    
    func display(searchBarPlaceholder: String) {
        searchController.searchBar.placeholder = searchBarPlaceholder
    }
}
