//
//  CustomTabbarViewController.swift
//  Walmart-iOS
//
//  Created by TriNgo on 3/25/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import UIKit

class CustomTabbarViewController: UITabBarController {
    
    var isReset: Bool = true {
        didSet {
            print("didSet isReset \(isReset)")
        }
    }
}
