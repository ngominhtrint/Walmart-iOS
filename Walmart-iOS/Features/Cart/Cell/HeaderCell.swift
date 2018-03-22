//
//  HeaderCell.swift
//  Walmart-iOS
//
//  Created by TriNgo on 3/22/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {

    @IBOutlet weak var btnCheckout: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnCheckout.boundaryWithBackground(color: UIColor.orange)
    }
    
}
