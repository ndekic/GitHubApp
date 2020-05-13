//
//  RepositoryDetailsRouter.swift
//  GitHubApp
//
//  Created by Nikola on 12/05/2020.
//

import Foundation
import UIKit

protocol RepositoryDetailsViewRouter: ViewRouter {
    func presentWebViewPicker(repositoryDetailViewController: RepositoryDetailsViewController, url: String, completionHandler: @escaping (Bool) -> Void)
}

class RepositoryDetailsViewRouterImplementation: RepositoryDetailsViewRouter {
    fileprivate weak var repositoryDetailViewController: RepositoryDetailsViewController?
    
    init(repositoryDetailViewController: RepositoryDetailsViewController) {
        self.repositoryDetailViewController = repositoryDetailViewController
    }
    
    func presentWebViewPicker(repositoryDetailViewController: RepositoryDetailsViewController, url: String, completionHandler: @escaping (Bool) -> Void) {
        UIAlertController().presentWebViewPicker(controller: repositoryDetailViewController, url: url, completionHandler: completionHandler)
    }
}
