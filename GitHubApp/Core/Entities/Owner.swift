//
//  Owner.swift
//  GitHubApp
//
//  Created by Nikola on 06/05/2020.
//

import Foundation

import Foundation

struct Owner: Codable {
    var id: Int64
    var login: String
    var avatar_url: String
    var url: String
}

extension Owner: Equatable { }

func == (lhs: Owner, rhs: Owner) -> Bool {
    return lhs.id == rhs.id
}
