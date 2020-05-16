//
//  RepositoriesPresenter.swift
//  GitHubApp
//
//  Created by Nikola on 06/05/2020.
//

import Foundation
import UIKit

protocol RepositoriesView: class {
    func display(screenTitle: String)
    func refreshRepositoriesView()
    func displayRepositoriesRetrievalError(title: String, message: String)
    func showLoader()
    func hideLoader()
    func display(searchBarPlaceholder: String)
}

protocol RepositoriesPresenter {
    var numberOfRepositories: Int { get }
    var router: RepositoriesViewRouter { get }
    func viewDidLoad()
    func configure(cell: RepositoryTableViewCell, forRow row: Int)
    func didSelect(row: Int)
    func didSelectOwnerDetails(row: Int)
    func getRepositories(query: String?, sort: String?, sortOrder: String?)
    func sortRepositories(sort: String)
    var repositorySortKeys: Array<String> { get }
    func loginButtonPressed()

}

class RepositoriesPresenterImplementation: RepositoriesPresenter {
    
    fileprivate weak var view: RepositoriesView?
    fileprivate let displayRepositoriesUseCase: DisplayRepositoriesUseCase
    internal let router: RepositoriesViewRouter
    
    var repositories = [Repository]()
    
    var numberOfRepositories: Int {
        return repositories.count
    }
    
    init(view: RepositoriesView,
         displayRepositoriesUseCase: DisplayRepositoriesUseCase,
         router: RepositoriesViewRouter) {
        self.view = view
        self.displayRepositoriesUseCase = displayRepositoriesUseCase
        self.router = router
        
    }
    
    // MARK: - RepositoriesPresenter
    
    func viewDidLoad() {
        getRepositories(query: nil, sort: nil, sortOrder: nil)
        view?.display(searchBarPlaceholder: "search_repositories_placeholder".localized())
        view?.display(screenTitle: "repositories_title".localized())
    }
    
    func configure(cell: RepositoryTableViewCell, forRow row: Int) {
        let repository = repositories[row]
        cell.display(repository: repository)
        
        cell.ownerNameButton.tag = row
        cell.ownerNameButton.addTarget(self, action:#selector(buttonClicked), for:.touchUpInside)
    }
    
    func didSelect(row: Int) {
        let repository = repositories[row]
        
        router.presentDetailsView(for: repository)
    }
    
    func didSelectOwnerDetails(row: Int) {
        let repository = repositories[row]
        router.presentOwnerDetailsView(for: repository)
    }
    
    func getRepositories(query: String?, sort: String?, sortOrder: String?) {
        view?.showLoader()
        self.displayRepositoriesUseCase.displayRepositories(query: query ?? "iOS", sort: sort ?? "stars", sortOrder: sortOrder ?? "desc") { (result) in
            switch result {
            case let .success(repositories):
                self.handleRepositoriesReceived(repositories)
            case let .failure(error):
                self.handleRepositoriesError(error)
            }
        }
    }
    
    func sortRepositories(sort: String) {
        var repositories = self.repositories
        
        switch sort {
        case repositorySortKeys[0]:
            repositories = repositories.sorted(by: { $0.stargazers_count > $1.stargazers_count })
        case repositorySortKeys[1]:
            repositories = repositories.sorted(by: { $0.forks_count > $1.forks_count })
        default:
            repositories = repositories.sorted(by: { $0.updated_at > $1.updated_at })
        }
        
        handleRepositoriesReceived(repositories)
    }
    
    var repositorySortKeys: Array<String> {
        return ["Stars", "Forks", "Updated"]
    }
    
    func loginButtonPressed() {
        router.presentLogin()
    }
    
    // MARK: - Private
    
    fileprivate func handleRepositoriesReceived(_ repositories: [Repository]) {
        self.repositories = repositories
        view?.refreshRepositoriesView()
        view?.hideLoader()
    }
    
    fileprivate func handleRepositoriesError(_ error: Error) {
        // Here we could check the error code and display a localized error message
        view?.displayRepositoriesRetrievalError(title: "Error", message: error.localizedDescription)
        view?.hideLoader()
    }
    
    // MARK: - Selectors
    
    @objc func buttonClicked(sender:UIButton) {
        didSelectOwnerDetails(row: sender.tag)
    }
    
}
