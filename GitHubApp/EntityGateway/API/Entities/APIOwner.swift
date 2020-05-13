//
//  APIOwner.swift
//  GitHubApp
//
//  Created by Nikola on 06/05/2020.
//

import Foundation

struct ApiOwner: Decodable {
    var id: Int64
    var login: String
    var avatar_url: String
    var url: String

    
    enum CodingKeys: String, CodingKey {
        case id, login, avatar_url, url = "html_url"
    }
}

extension ApiOwner {
    var owner: Owner {
        return Owner(id: id, login: login, avatar_url: avatar_url, url: url)
    }
}
