//
//  RepositoryGateway.swift
//  GitHubApp
//
//  Created by Nikola on 06/05/2020.
//

import Foundation

typealias FetchRepositoryEntityGatewayCompletionHandler = (_ repositories: Result<[Repository]>) -> Void


protocol RepositoryGateway {
    func fetchRepositories(query: String, sort: String, sortOrder: String, completionHandler: @escaping FetchRepositoryEntityGatewayCompletionHandler)
}
