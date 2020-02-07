//
//  Array+Extension.swift
//
//  Created by Kartheek Boggarapu on 23/11/19.
//  Copyright © 2019. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    func removeDuplicates() -> [Element] {
        var result = [Element]()

        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }

        return result
    }
}
