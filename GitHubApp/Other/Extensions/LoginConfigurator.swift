//
//  LoginConfigurator.swift
//  GitHubApp
//
//  Created by Nikola on 13/05/2020.
//

import Foundation


protocol LoginConfigurator {
    func configure(loginViewController: LoginViewController)
}

class LoginConfiguratorImplementation: LoginConfigurator{
    
    func configure(loginViewController: LoginViewController) {
        let router = LoginViewRouterImplementation(loginViewController: loginViewController)
        
        let presenter = LoginPresenterImplementation(view: loginViewController, router: router)
        loginViewController.presenter = presenter
    }
}
