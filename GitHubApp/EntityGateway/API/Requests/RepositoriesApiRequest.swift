//
//  RepositoriesApiRequest.swift
//  GitHubApp
//
//  Created by Nikola on 06/05/2020.
//

import Foundation

struct RepositoriesApiRequest: ApiRequest {
    let query: String
    let sort: String
    let sortOrder: String
    
    var urlRequest: URLRequest {
        let url: URL! = URL(string: "https://api.github.com/search/repositories?q=\(query)&sort=\(sort)&order=\(sortOrder)")
        var request = URLRequest(url: url)
        
        request.setValue("application/vnd.github.mercy-preview+json", forHTTPHeaderField: "Accept")
        
        request.httpMethod = "GET"
        
        return request
    }
}
