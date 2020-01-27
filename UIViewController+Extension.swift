//
//  UIViewController+Extension.swift
//  Zaggle
//
//  Created by Kartheek Boggarapu on 05/12/18.
//  Copyright © 2018 Zaggle. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController: NVActivityIndicatorViewable {

    func showHUD() {
        startAnimating(CGSize(width: 80, height: 80), message: "", type: NVActivityIndicatorType.ballRotateChase, color: UIColor.legend_red, backgroundColor: UIColor.white.withAlphaComponent(0.5) ,fadeInAnimation: nil)
    }
    
    func hideHUD() {
        self.stopAnimating(nil)
    }
}

extension String {
    func widthOf(_ font: UIFont) -> CGFloat {
        return self.size(withAttributes: [NSAttributedString.Key.font: font]).width
    }
}

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

extension Date {
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    //usage
    // Date().string(format: "yyyy-MM-dd")
    
}
extension String{
    func fromStringToDate(format:String ) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.APIDateFormat
        if let dateObj = formatter.date(from: self) {
              formatter.dateFormat = format
            return formatter.string(from: dateObj)
        }
      
        return self
    }
}
