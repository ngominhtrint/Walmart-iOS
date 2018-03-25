//
//  CustomTabbarViewController.swift
//  Walmart-iOS
//
//  Created by TriNgo on 3/25/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import UIKit

class CustomTabbarViewController: UITabBarController {
    
    private let yellow = UIColor(red: 253/255, green: 209/255, blue: 89/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = yellow
        self.tabBar.unselectedItemTintColor = UIColor.white
    }
    
}
