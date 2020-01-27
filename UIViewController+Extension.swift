//
//  UIViewController+Extension.swift
//  Zaggle
//
//  Created by Kartheek Boggarapu on 05/12/18.
//  Copyright © 2018 Zaggle. All rights reserved.
//

import UIKit

extension UIApplication {
    //  USAGE:
    //  UIApplication.shared.topViewController
    
    var topViewController: UIViewController? {
        guard var topViewController = UIApplication.shared.keyWindow?.rootViewController else { return nil }

        while let presentedViewController = topViewController.presentedViewController {
            topViewController = presentedViewController
        }
        return topViewController
    }

    var topNavigationController: UINavigationController? {
        return topViewController as? UINavigationController
    }
}
extension UIViewController{
    
    func performUIAlert(title: String?, message: String?, actionTitles:[String?], actions:[(UIAlertAction) -> Void]) {
        
        let alert =  UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
    // ------- Usage -------
    //    self.performUIAlert(title: "Title", message: nil, actionTitles: ["OK", "Cancel"], actions:
    //    [{ _ in self.okAction()}, {_ in self.cancelAction()}])
    
    
    func showActionSheet(title: String?, message: String?, showCancel: Bool, actionTitles:[String?], actions:[(UIAlertAction) -> Void]){
         let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            actionSheet.addAction(action)
        }
        if(showCancel) {
            actionSheet.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        }
       self.present(actionSheet, animated: true, completion: nil)
    }
}
