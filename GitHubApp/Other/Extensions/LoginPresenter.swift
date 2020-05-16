//
//  LoginPresenter.swift
//  GitHubApp
//
//  Created by Nikola on 13/05/2020.
//

import Foundation

protocol LoginView: class {
    func display(screenTitle: String)
}

protocol LoginPresenter {
    var router: LoginViewRouter { get }
    func viewDidLoad()
}

class LoginPresenterImplementation: LoginPresenter {

    fileprivate weak var view: LoginView?
    internal let router: LoginViewRouter
    
    init(view: LoginView,
         router: LoginViewRouter) {
        self.view = view
        self.router = router        
    }
    
    func viewDidLoad() {
        view?.display(screenTitle: "login_title".localized())
    }
    
}
