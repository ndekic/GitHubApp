//
//  LoginRouter.swift
//  GitHubApp
//
//  Created by Nikola on 13/05/2020.
//

import Foundation

protocol LoginViewRouter: ViewRouter {
}

class LoginViewRouterImplementation: LoginViewRouter {
    fileprivate weak var loginViewController: LoginViewController?
    
    init(loginViewController: LoginViewController) {
        self.loginViewController = loginViewController
    }
}
