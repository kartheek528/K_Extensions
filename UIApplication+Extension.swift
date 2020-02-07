//
//  UIApplication+Extension.swift
//
//  Created by Kartheek Boggarapu on 07/02/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation
import UIKit

public extension UIApplication {
    
    var topViewController: UIViewController? {
        var topViewController: UIViewController?
        if #available(iOS 13, *) {
            // iOS 13 (or newer) code
            let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
            topViewController = keyWindow?.rootViewController
        } else {
            // iOS 12 or older code
            topViewController = UIApplication.shared.keyWindow?.rootViewController
        }

        while let presentedViewController = topViewController?.presentedViewController {
            topViewController = presentedViewController
        }
        return topViewController
    }

    var topNavigationController: UINavigationController? {
        return topViewController as? UINavigationController
    }
}
