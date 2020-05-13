//
//  RepositoryDetailsPresenter.swift
//  GitHubApp
//
//  Created by Nikola on 12/05/2020.
//

import Foundation

protocol RepositoryDetailsView: class {
    func display(screenTitle: String)
    func display(repositoryName: String)
    func display(ownerName: String)
    func display(forkCount: String)
    func display(issueCount: String)
    func display(createdAt: String)
    func display(updatedAt: String)
    func display(programmingLanguage: String)
    func display(URL: String)
    func displayURLError()
}

protocol RepositoryDetailsPresenter {
    var router: RepositoryDetailsViewRouter { get }
    func viewDidLoad()
    func presentRepoUrl(repositoryDetailViewController: RepositoryDetailsViewController)
    func presentOwnerUrl(repositoryDetailViewController: RepositoryDetailsViewController)
}

class RepositoryDetailsPresenterImplementation: RepositoryDetailsPresenter {
    fileprivate weak var view: RepositoryDetailsView?
    internal let router: RepositoryDetailsViewRouter
    fileprivate let repository: Repository
    
    init(view: RepositoryDetailsView,
         repository: Repository,
         router: RepositoryDetailsViewRouter) {
        self.view = view
        self.router = router
        self.repository = repository
        
    }

    func viewDidLoad() {
        view?.display(screenTitle: "Repository Details")
        view?.display(repositoryName: repository.name)
        view?.display(ownerName: repository.owner.login)
        view?.display(forkCount: String("Forks: \(repository.forks_count)"))
        view?.display(issueCount: String("Issues: \(repository.open_issues_count)"))
        view?.display(createdAt: "Created at: \(repository.created_at.toString())")
        view?.display(updatedAt: "Updated at: \(repository.updated_at.toString())")
        view?.display(URL: repository.url)
        view?.display(programmingLanguage: "Programming language: \(repository.language ?? "N/A")" )
    }
    
    func presentRepoUrl(repositoryDetailViewController: RepositoryDetailsViewController) {
        router.presentWebViewPicker(repositoryDetailViewController: repositoryDetailViewController, url: repository.url) { (isSuccess) in
            if !isSuccess {
                self.view?.displayURLError()
            }
        }
    }
    
    func presentOwnerUrl(repositoryDetailViewController: RepositoryDetailsViewController) {
        router.presentWebViewPicker(repositoryDetailViewController: repositoryDetailViewController, url: repository.owner.url) { (isSuccess) in
            if !isSuccess {
                self.view?.displayURLError()
            }
        }
    }
    
}
