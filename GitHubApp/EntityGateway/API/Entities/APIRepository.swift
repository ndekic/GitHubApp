//
//  APIRepository.swift
//  GitHubApp
//
//  Created by Nikola on 06/05/2020.
//

import Foundation

struct ApiRepository: Decodable {
    var id: Int64
    var created_at: String
    var updated_at: String
    var name: String
    var full_name: String
    var url: String
    var forks_count: Int64
    var open_issues_count: Int64
    var watchers_count: Int64
    var stargazers_count: Int64
    var language: String?
    var ownerData: ApiOwner
    
    enum CodingKeys: String, CodingKey {
        case id, created_at,updated_at, name, full_name, url = "html_url", forks_count, open_issues_count, watchers_count, stargazers_count, language, ownerData = "owner"
    }
    
}

extension ApiRepository {
    var repository: Repository {
        return Repository(id: id, created_at: created_at.toDate(), updated_at: updated_at.toDate(), name: name, full_name: full_name, url: url, forks_count: forks_count, stargazers_count: stargazers_count, open_issues_count: open_issues_count, watchers_count: watchers_count, language: language, owner: Owner(id: ownerData.id, login: ownerData.login, avatar_url: ownerData.avatar_url, url: ownerData.url))
    }
    
}

struct ApiRepositories : Decodable {
    let repositories: [ApiRepository]
    
    enum CodingKeys: String, CodingKey {
        case repositories = "items"
    }
}
