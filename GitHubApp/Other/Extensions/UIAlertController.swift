//
//  UIActionSheetExtension.swift
//  GitHubApp
//
//  Created by Nikola on 12/05/2020.
//

import UIKit

extension UIAlertController {
    func presentWebViewPicker(controller:UIViewController, url: String, completionHandler: @escaping (Bool) -> Void) {
        let actionSheetController: UIAlertController = UIAlertController(title: "Open with", message: message, preferredStyle: .actionSheet)
        
        actionSheetController.addAction(UIAlertAction(title: "Chrome" , style: .default , handler:{ _ in
            if let url = URL(string: "googlechromes://\(url)") {
                UIApplication.shared.open(url) { success in
                    completionHandler(success)
                }
            }
        }))
        actionSheetController.addAction(UIAlertAction(title: "Firefox" , style: .default , handler:{ _ in
            if let url = URL(string: "firefox://\(url)") {
                UIApplication.shared.open(url) { success in
                    completionHandler(success)
                }
            }
        }))
        actionSheetController.addAction(UIAlertAction(title: "Safari" , style: .default , handler:{ _ in
            if let url = URL(string: url) {
                UIApplication.shared.open(url) { success in
                    completionHandler(success)
                }
            }
        }))
        
        actionSheetController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        controller.present(actionSheetController, animated: true, completion: nil)
    }
}
