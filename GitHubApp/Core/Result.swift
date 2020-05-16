//
//  Result.swift
//  GitHubApp
//
//  Created by Nikola on 06/05/2020.
//

import Foundation

struct CoreError: Error {
    var localizedDescription: String {
        return message
    }
    
    var message = "general_error_message".localized()
}

typealias Result<T> = Swift.Result<T, Error>
