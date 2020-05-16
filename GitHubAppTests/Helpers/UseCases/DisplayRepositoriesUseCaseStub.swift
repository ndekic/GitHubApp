//
//  DisplayRepositoriesUseCaseStub.swift
//  GitHubAppTests
//
//  Created by Nikola on 16/05/2020.
//

import Foundation
@testable import GitHubApp

class DisplayRepositoriesUseCaseStub: DisplayRepositoriesUseCase {
    var resultToBeReturned: Result<[Repository]>!
    
    func displayRepositories(query: String, sort: String, sortOrder: String, completionHandler: @escaping DisplayRepositoriesUseCaseCompletionHandler) {
        completionHandler(resultToBeReturned)
    }
}
