//
//  UIView+Ext.swift
//  Walmart-iOS
//
//  Created by TriNgo on 3/22/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import UIKit

extension UIView {
    
    public func boundary(color: UIColor) {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = color.cgColor
    }
    
    public func boundaryWithBackground(color: UIColor) {
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = color.cgColor
        self.layer.backgroundColor = color.cgColor
    }
}
