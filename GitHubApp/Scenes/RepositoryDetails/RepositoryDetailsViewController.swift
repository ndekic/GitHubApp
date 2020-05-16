//
//  RepositoryDetailsViewController.swift
//  GitHubApp
//
//  Created by Nikola on 12/05/2020.
//

import UIKit

class RepositoryDetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var repsoitoryNameLabel: UILabel!
    @IBOutlet weak var ownerNameButton: UIButton!
    @IBOutlet weak var fourkCountLabel: UILabel!
    @IBOutlet weak var issueCountLabel: UILabel!
    @IBOutlet weak var programmingLanguageLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var updatedAtLabel: UILabel!
    @IBOutlet weak var urlButton: UIButton!
    
    var presenter: RepositoryDetailsPresenter!
    var configurator: RepositoryDetailsConfigurator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configurator.configure(repositoryDetailsViewController: self)
        presenter.viewDidLoad()
    }
    
    // MARK: - IBOutlets actions
    @IBAction func ownerNameButtonAction(_ sender: Any) {
        presenter.presentOwnerUrl(repositoryDetailViewController: self)
    }
    
    @IBAction func urlButtonAction(_ sender: Any) {
        presenter.presentRepoUrl(repositoryDetailViewController: self)
    }
}

// MARK: - RepositoryDetailsView
extension RepositoryDetailsViewController: RepositoryDetailsView {
    func display(screenTitle: String) {
        self.title = screenTitle
    }
    
    func displayURLError() {
        presentAlert(withTitle: "url_error".localized(), message: nil)
    }
    
    func display(repositoryName: String) {
        repsoitoryNameLabel.text = repositoryName
    }
    
    func display(ownerName: String) {
        ownerNameButton.setTitle(ownerName, for: .normal)
        
    }
    
    func display(forkCount: String) {
        fourkCountLabel.text = forkCount
        
    }
    
    func display(issueCount: String) {
        issueCountLabel.text = issueCount
        
    }
    
    func display(createdAt: String) {
        createdAtLabel.text = createdAt
        
    }
    
    func display(updatedAt: String) {
        updatedAtLabel.text = updatedAt
        
    }
    
    func display(URL: String) {
        urlButton.setTitle(URL, for: .normal)
    }
    
    func display(programmingLanguage: String) {
        programmingLanguageLabel.text = programmingLanguage
        
    }
}
