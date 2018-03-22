//
//  FooterCell.swift
//  Walmart-iOS
//
//  Created by TriNgo on 3/22/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import UIKit

class FooterCell: UITableViewCell {

    @IBOutlet weak var boundaryView: UIView!
    @IBOutlet weak var btnCheckout: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        boundaryView.boundary(color: UIColor.lightGray)
        btnCheckout.boundaryWithBackground(color: UIColor.orange)
    }
    
    
}
