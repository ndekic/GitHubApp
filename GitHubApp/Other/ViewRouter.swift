//
//  ViewRouter.swift
//  GitHubApp
//
//  Created by Nikola on 06/05/2020.
//

import UIKit

protocol ViewRouter {
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

extension ViewRouter {
    func prepare(for segue: UIStoryboardSegue, sender: Any?) { }
}
