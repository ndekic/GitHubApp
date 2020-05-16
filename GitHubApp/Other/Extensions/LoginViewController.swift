//
//  LoginViewController.swift
//  GitHubApp
//
//  Created by Nikola on 13/05/2020.
//

import UIKit

class LoginViewController: UIViewController {
    
    var presenter: LoginPresenter!
    var configurator: LoginConfigurator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configurator.configure(loginViewController: self)
        presenter.viewDidLoad()
    }
    
}

extension LoginViewController: LoginView {
    func display(screenTitle: String) {
        self.title = screenTitle
    }
    
}
