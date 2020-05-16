//
//  DisplayRepositoryList.swift
//  GitHubApp
//
//  Created by Nikola on 06/05/2020.
//

import Foundation

typealias DisplayRepositoriesUseCaseCompletionHandler = (_ Repositories: Result<[Repository]>) -> Void

protocol DisplayRepositoriesUseCase {
    func displayRepositories(query: String, sort: String, sortOrder: String, completionHandler: @escaping DisplayRepositoriesUseCaseCompletionHandler)
}

class DisplayRepositoriesListUseCaseImplementation: DisplayRepositoriesUseCase {
    let repositoryGateway: RepositoryGateway
    
    init(repositoryGateway: RepositoryGateway) {
        self.repositoryGateway = repositoryGateway
    }
    
    // MARK: - DisplayRepositoriesUseCase
    func displayRepositories(query: String, sort: String, sortOrder: String, completionHandler: @escaping (Result<[Repository]>) -> Void) {
        self.repositoryGateway.fetchRepositories(query: query, sort: sort, sortOrder: sortOrder) { (result) in
            completionHandler(result)
        }
    }
}


