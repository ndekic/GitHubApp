//
//  Repository.swift
//  GitHubApp
//
//  Created by Nikola on 06/05/2020.
//

import Foundation

struct Repository: Codable {
    var id: Int64
    var created_at: Date
    var updated_at: Date
    var name: String
    var full_name: String
    var url: String
    var forks_count: Int64
    var stargazers_count: Int64
    var open_issues_count: Int64
    var watchers_count: Int64
    var language: String?
    var owner: Owner
}
