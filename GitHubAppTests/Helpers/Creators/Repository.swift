//
//  Repository.swift
//  GitHubAppTests
//
//  Created by Nikola on 16/05/2020.
//

import Foundation

import Foundation
@testable import GitHubApp

extension Repository {
    static func createRepositoriesArray(numberOfElements: Int = 2) -> [Repository] {
        var repositories = [Repository]()
        
        for i in 0..<numberOfElements {
            let repository = createRepository(index: i)
            repositories.append(repository)
        }
        
        return repositories
    }
    
    static func createRepository(index: Int = 0) -> Repository {
        
        return Repository(id: Int64(index), created_at: Date(), updated_at: Date(), name: "Name \(index)", full_name: "Full name \(index)", url: "URL \(index)", forks_count: Int64(index), stargazers_count: Int64(index), open_issues_count: Int64(index), watchers_count: Int64(index), language: nil, owner: Owner(id: Int64(index), login: "Name \(index)", avatar_url: "avatar.com", url: "url.com"))
    }
}
