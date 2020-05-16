//
//  NSError.swift
//  GitHubAppTests
//
//  Created by Nikola on 16/05/2020.
//

import Foundation

extension NSError {
    static func createError(withMessage message: String) -> NSError {
        return NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: message])
    }
}
