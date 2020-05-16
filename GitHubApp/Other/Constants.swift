//
//  Constants.swift
//  GitHubApp
//
//  Created by Nikola on 16/05/2020.
//

import UIKit

struct Constants{
    static let baseURL: String = "https://api.github.com/search/repositories"
    static let defaultCellHeight: CGFloat = 120
}


struct SegueIdentifiers{
    static let repositoryDetailsSegue: String = "RepositoriesSceeneToRepositoryDetailsSceneSegue"
    static let ownerDetailsSegue: String = "RepositoriesSceeneToOwnerDetailsSceneSegue"
}

struct CellIdentifiers {
    static let repositoryCellIdentifier: String = "RepositoryTableViewCell"
}
