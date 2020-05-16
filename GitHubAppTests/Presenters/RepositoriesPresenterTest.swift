//
//  RepositoriesPresenterTest.swift
//  GitHubAppTests
//
//  Created by Nikola on 16/05/2020.
//

import XCTest
@testable import GitHubApp

class RepositoriesPresenterTest: XCTestCase {
    let diplayRepositoriesUseCaseStub = DisplayRepositoriesUseCaseStub()
    let repositoriesViewRouterSpy = RepositoriesViewRouterSpy()
    let repositoriesViewSpy = RepositoriesViewSpy()
    var repositoriesPresenter: RepositoriesPresenterImplementation!
    
    // MARK: - Set up
    override func setUp() {
        super.setUp()
        repositoriesPresenter = RepositoriesPresenterImplementation(view: repositoriesViewSpy,
                                                      displayRepositoriesUseCase: diplayRepositoriesUseCaseStub,
                                                      router: repositoriesViewRouterSpy)
    }
    
    // MARK: - Tests
    func test_viewDidLoad_success_refreshRepositoriesView_called() {
        let repositoriesToBeReturned = Repository.createRepositoriesArray()
        diplayRepositoriesUseCaseStub.resultToBeReturned = .success(repositoriesToBeReturned)
        
        repositoriesPresenter.viewDidLoad()
        
        XCTAssertTrue(repositoriesViewSpy.refreshRepositoriesViewCalled, "refreshRepositoriesView was not called")
    }
    
}
