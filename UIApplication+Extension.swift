//
//  UIApplication+Extension.swift
//
//  Created by Kartheek Boggarapu on 07/02/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation
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
