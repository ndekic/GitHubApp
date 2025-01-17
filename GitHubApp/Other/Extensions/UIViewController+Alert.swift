//
//  UIViewController+Alert.swift
//  GitHubApp
//
//  Created by Nikola on 12/05/2020.
//

import UIKit

extension UIViewController {
    func presentAlert(withTitle title:String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok_label".localized(), style: .cancel, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}
