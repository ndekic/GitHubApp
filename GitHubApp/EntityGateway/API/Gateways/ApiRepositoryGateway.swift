//
//  ApiRepositoryGateway.swift
//  GitHubApp
//
//  Created by Nikola on 06/05/2020.
//

import Foundation

protocol ApiRepositoryGateway: RepositoryGateway {
    // no need for now
}

class ApiReposiotryGatewayImplementation: ApiRepositoryGateway {
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    func fetchRepositories(query: String, sort: String, sortOrder: String, completionHandler: @escaping (Result<[Repository]>) -> Void) {
        let repositoriesApiRequest = RepositoriesApiRequest(query: query, sort: sort, sortOrder: sortOrder)
        apiClient.execute(request: repositoriesApiRequest) { (result: Result<ApiResponse<ApiRepositories>>) in
            switch result {
            case let .success(response):
                let repository = response.entity.repositories.map { return $0.repository }
                completionHandler(.success(repository))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
    
}
