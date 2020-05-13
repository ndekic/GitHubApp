//
//  OwnerDetailsPresenter.swift
//  GitHubApp
//
//  Created by Nikola on 13/05/2020.
//

import Foundation

protocol OwnerDetailsView: class {
    func display(screenTitle: String)
    func display(ownerName: String)
    func display(URL: String)
    func display(avatarURL: String)
    func displayURLError()
}

protocol OwnerDetailsPresenter {
    var router: OwnerDetailsViewRouter { get }
    func viewDidLoad()
    func presentOwnerUrl(ownerDetailsViewController: OwnerDetailsViewController)
}

class OwnerDetailsPresenterImplementation: OwnerDetailsPresenter {
    fileprivate weak var view: OwnerDetailsView?
    internal let router: OwnerDetailsViewRouter
    fileprivate let owner: Owner
    
    init(view: OwnerDetailsView,
         owner: Owner,
         router: OwnerDetailsViewRouter) {
        self.view = view
        self.router = router
        self.owner = owner
        
    }
    
    func viewDidLoad() {
        view?.display(screenTitle: "Owner Details")
        view?.display(ownerName: owner.login)
        view?.display(URL: owner.url)
        view?.display(avatarURL: owner.avatar_url)
    }
    
    func presentOwnerUrl(ownerDetailsViewController: OwnerDetailsViewController) {
         router.presentWebViewPicker(ownerDetailsViewController: ownerDetailsViewController, url: owner.url) { (isSuccess) in
             if !isSuccess {
                 self.view?.displayURLError()
             }
         }
     }
}
