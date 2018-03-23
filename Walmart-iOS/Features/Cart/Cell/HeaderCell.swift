//
//  HeaderCell.swift
//  Walmart-iOS
//
//  Created by TriNgo on 3/22/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import UIKit

protocol HeaderCellDelegate: class {
    func onCheckoutAction(indexPath: IndexPath)
}

class HeaderCell: UITableViewCell {

    @IBOutlet weak var btnCheckout: UIButton!
    @IBOutlet weak var lbTotal: UILabel!
    
    var indexPath: IndexPath!
    weak var delegate: HeaderCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnCheckout.boundaryWithBackground(color: UIColor.orange)
    }
    
    var product: Product? {
        didSet {
            if let product = product {
                lbTotal.text = "Est. total: $\(String(describing: product.total))"
                btnCheckout.setTitle("Check Out (\(String(describing: product.totalItem)))", for: .normal)
            }
        }
    }
    
    @IBAction func onCheckoutAction(_ sender: Any) {
        delegate?.onCheckoutAction(indexPath: indexPath)
    }
}
