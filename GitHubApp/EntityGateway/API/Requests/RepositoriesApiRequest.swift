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
        let originalUrl = "\(Constants.baseURL)?q=\(query)&sort=\(sort)&order=\(sortOrder)"
        if let encoded = originalUrl.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed), let url = URL(string: encoded) {
            var request = URLRequest(url: url)
            request.setValue("application/vnd.github.mercy-preview+json", forHTTPHeaderField: "Accept")
            request.httpMethod = "GET"
            
            return request
        }
        
        return URLRequest(url: URL(string: Constants.baseURL)!)
    }
}
