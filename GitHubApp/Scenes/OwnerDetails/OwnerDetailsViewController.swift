//
//  OwnerDetailsViewController.swift
//  GitHubApp
//
//  Created by Nikola on 13/05/2020.
//

import UIKit
import SDWebImage

class OwnerDetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var ownerNameLabel: UILabel!
    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var urlButton: UIButton!
    
    var presenter: OwnerDetailsPresenter!
    var configurator: OwnerDetailsConfigurator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configurator.configure(ownerDetailsViewController: self)
        presenter.viewDidLoad()
    }
    
    // MARK: - IBOutlets actions
    @IBAction func urlButtonAction(_ sender: Any) {
        presenter.presentOwnerUrl(ownerDetailsViewController: self)
    }
    
}

extension OwnerDetailsViewController: OwnerDetailsView {
    func display(screenTitle: String) {
        self.title = screenTitle
    }
    
    func display(avatarURL: String) {
        ownerImageView.sd_setImage(with: URL(string: avatarURL), placeholderImage: UIImage.defaultImage())
    }
    
    func display(ownerName: String) {
        ownerNameLabel.text = ownerName
    }
    
    func display(URL: String) {
        urlButton.setTitle(URL, for: .normal)
    }
    
    func displayURLError() {
        presentAlert(withTitle: "Unable to open URL", message: nil)
    }
}
