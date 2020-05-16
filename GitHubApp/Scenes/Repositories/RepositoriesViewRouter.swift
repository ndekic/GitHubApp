//
//  RepositoriesViewRouter.swift
//  GitHubApp
//
//  Created by Nikola on 06/05/2020.
//

import UIKit

protocol RepositoriesViewRouter: ViewRouter {
    func presentDetailsView(for repository: Repository)
    func presentOwnerDetailsView(for repository: Repository)
}

class RepositoriesViewRouterImplementation: RepositoriesViewRouter {
    fileprivate weak var repositorysTableViewController: RepositoriesTableViewController?
    fileprivate var repository: Repository!
    
    init(repositorysTableViewController: RepositoriesTableViewController) {
        self.repositorysTableViewController = repositorysTableViewController
    }
    
    // MARK: - RepositoriesViewRouter
    func presentDetailsView(for repository: Repository) {
        self.repository = repository
        repositorysTableViewController?.performSegue(withIdentifier: SegueIdentifiers.repositoryDetailsSegue, sender: nil)
    }
    
    func presentOwnerDetailsView(for repository: Repository) {
        self.repository = repository
        repositorysTableViewController?.performSegue(withIdentifier: SegueIdentifiers.ownerDetailsSegue, sender: nil)
    }
    
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let repositoryDetailsViewController = segue.destination as? RepositoryDetailsViewController {
            repositoryDetailsViewController.configurator = RepositoryDetailsConfiguratorImplementation(repository: repository)
        } else if let ownerDetailsViewController = segue.destination as? OwnerDetailsViewController {
            ownerDetailsViewController.configurator = OwnerDetailsConfiguratorImplementation(owner: repository.owner)
        }
    }
}
