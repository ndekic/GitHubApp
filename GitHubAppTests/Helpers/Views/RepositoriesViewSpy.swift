//
//  RepositoriesViewSpy.swift
//  GitHubAppTests
//
//  Created by Nikola on 16/05/2020.
//

import Foundation
@testable import GitHubApp

class RepositoriesViewSpy: RepositoriesView {
    var refreshRepositoriesViewCalled = false
    var displaySearchBarPlaceholder: String?
    var displayDcreenTitle: String?
    var displayRepositortiesRetrievalErrorTitle: String?
    var displayRepositoriesRetrievalErrorMessage: String?
    
    func refreshRepositoriesView() {
        refreshRepositoriesViewCalled = true
    }
    
    func displayRepositoriesRetrievalError(title: String, message: String) {
        displayRepositortiesRetrievalErrorTitle = title
        displayRepositoriesRetrievalErrorMessage = message
    }
    
    func display(screenTitle: String) {
        displayDcreenTitle = screenTitle
    }
    
    func showLoader() {
        // empty
    }
    
    func hideLoader() {
        // empty
        
    }
    
    func display(searchBarPlaceholder: String) {
        displaySearchBarPlaceholder = searchBarPlaceholder
    }
}
