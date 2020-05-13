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
        view?.display(screenTitle: "repository_details_title".localized())
        view?.display(repositoryName: repository.name)
        view?.display(ownerName: repository.owner.login)
        view?.display(forkCount: String("\("forks_label".localized()): \(repository.forks_count)"))
        view?.display(issueCount: String("\("issues_label".localized()): \(repository.open_issues_count)"))
        view?.display(createdAt: "\("created_at_label".localized()): \(repository.created_at.toString())")
        view?.display(updatedAt: "\("updated_at_label".localized()): \(repository.updated_at.toString())")
        view?.display(URL: repository.url)
        view?.display(programmingLanguage: "\("programming_language_label".localized()): \(repository.language ?? "N/A")" )
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
