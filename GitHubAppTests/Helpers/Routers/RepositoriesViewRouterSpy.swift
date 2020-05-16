//
//  RepositoriesViewRouterSpy.swift
//  GitHubAppTests
//
//  Created by Nikola on 16/05/2020.
//

import Foundation
@testable import GitHubApp

class RepositoriesViewRouterSpy: RepositoriesViewRouter {
    var passedRepository: Repository?
    
    func presentDetailsView(for repository: Repository) {
        passedRepository = repository
    }
    
    func presentOwnerDetailsView(for repository: Repository) {
        passedRepository = repository
    }
}
