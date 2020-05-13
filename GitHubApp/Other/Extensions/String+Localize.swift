//
//  String+Localize.swift
//  GitHubApp
//
//  Created by Nikola on 13/05/2020.
//

import Foundation

extension String {
    func localized() -> String {
        NSLocalizedString(self, comment: "")
    }
}
