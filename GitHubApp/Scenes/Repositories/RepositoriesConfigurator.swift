//
//  RepositoriesConfigurator.swift
//  GitHubApp
//
//  Created by Nikola on 06/05/2020.
//

import Foundation

protocol RepositoriesConfigurator {
    func configure(repositorysTableViewController: RepositoriesTableViewController)
}

class RepositoriesConfiguratorImplementation: RepositoriesConfigurator {
    
    func configure(repositorysTableViewController: RepositoriesTableViewController) {
        let apiClient = ApiClientImplementation(urlSessionConfiguration: URLSessionConfiguration.default,
                                                completionHandlerQueue: OperationQueue.main)
        let apiRepositoriesGateway = ApiReposiotryGatewayImplementation(apiClient: apiClient)
        
        
        let displayRepositoriesUseCase = DisplayRepositoriesListUseCaseImplementation(repositoryGateway: apiRepositoriesGateway)
        let router = RepositoriesViewRouterImplementation(repositorysTableViewController: repositorysTableViewController)
        
        let presenter = RepositoriesPresenterImplementation(view: repositorysTableViewController,
                                                            displayRepositoriesUseCase: displayRepositoriesUseCase,
                                                            router: router)
        
        repositorysTableViewController.presenter = presenter
    }
}
