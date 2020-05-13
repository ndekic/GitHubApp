//
//  RepositoryTableViewCell.swift
//  GitHubApp
//
//  Created by Nikola on 06/05/2020.
//

import UIKit
import SDWebImage

class RepositoryTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var forkCountLabel: UILabel!
    @IBOutlet weak var issueNumberLabel: UILabel!
    @IBOutlet weak var ownerNameButton: UIButton!
    
    func display(repository: Repository) {
        nameLabel.text = repository.name
        ownerNameButton.setTitle(repository.owner.login, for: .normal)
        forkCountLabel.text = String("\("forks_label".localized()): \(repository.forks_count)")
        issueNumberLabel.text = String("\("issues_label".localized()): \(repository.open_issues_count)")
        ownerImageView.sd_setImage(with: URL(string: repository.owner.avatar_url), placeholderImage: UIImage.defaultImage())
    }

}
