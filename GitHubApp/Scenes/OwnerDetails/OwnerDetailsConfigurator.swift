//
//  OwenerDetailsConfigurator.swift
//  GitHubApp
//
//  Created by Nikola on 13/05/2020.
//

import Foundation

protocol OwnerDetailsConfigurator {
    func configure(ownerDetailsViewController: OwnerDetailsViewController)
}

class OwnerDetailsConfiguratorImplementation: OwnerDetailsConfigurator{
    let owner: Owner
    
    init(owner: Owner) {
        self.owner = owner
    }
    
    func configure(ownerDetailsViewController: OwnerDetailsViewController) {
        let router = OwnerDetailsViewRouterImplementation(ownerDetailsViewController: ownerDetailsViewController)
        
        let presenter = OwnerDetailsPresenterImplementation(view: ownerDetailsViewController, owner: owner, router: router)
        ownerDetailsViewController.presenter = presenter
    }
}
