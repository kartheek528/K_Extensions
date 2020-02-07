//
//  NSObject+Extension.swift
//
//  Created by Kartheek Boggarapu on 07/02/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
