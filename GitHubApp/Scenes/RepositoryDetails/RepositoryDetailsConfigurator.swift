//
//  RepositoryDetailsConfigurator.swift
//  GitHubApp
//
//  Created by Nikola on 12/05/2020.
//

import Foundation

protocol RepositoryDetailsConfigurator {
    func configure(repositoryDetailsViewController: RepositoryDetailsViewController)
}

class RepositoryDetailsConfiguratorImplementation: RepositoryDetailsConfigurator {
    let repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func configure(repositoryDetailsViewController: RepositoryDetailsViewController) {
        let router = RepositoryDetailsViewRouterImplementation(repositoryDetailViewController: repositoryDetailsViewController)
        
        let presenter = RepositoryDetailsPresenterImplementation(view: repositoryDetailsViewController, repository: repository, router: router)
        repositoryDetailsViewController.presenter = presenter
    }
}
