//
//  OwnerDetailsRouter.swift
//  GitHubApp
//
//  Created by Nikola on 13/05/2020.
//

import Foundation
import UIKit

protocol OwnerDetailsViewRouter: ViewRouter {
    func presentWebViewPicker(ownerDetailsViewController: OwnerDetailsViewController, url: String, completionHandler: @escaping (Bool) -> Void)
}

class OwnerDetailsViewRouterImplementation: OwnerDetailsViewRouter {
    fileprivate weak var ownerDetailsViewController: OwnerDetailsViewController?
    
    init(ownerDetailsViewController: OwnerDetailsViewController) {
        self.ownerDetailsViewController = ownerDetailsViewController
    }
    
    
    func presentWebViewPicker(ownerDetailsViewController: OwnerDetailsViewController, url: String, completionHandler: @escaping (Bool) -> Void) {
        UIAlertController().presentWebViewPicker(controller: ownerDetailsViewController, url: url, completionHandler: completionHandler)
    }
}
