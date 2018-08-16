//
//  Extensions.swift
//  B-Store
//
//  Created by Marat on 15.08.2018.
//  Copyright © 2018 Marat. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func removeAllConstraints() {
        for constraint in self.constraints {
            self.removeConstraint(constraint)
        }
    }
}
