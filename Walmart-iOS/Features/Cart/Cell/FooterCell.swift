//
//  FooterCell.swift
//  Walmart-iOS
//
//  Created by TriNgo on 3/22/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import UIKit

protocol FooterCellDelegate: class {
    func onCheckoutAction()
}

class FooterCell: UITableViewCell {

    @IBOutlet weak var boundaryView: UIView!
    @IBOutlet weak var btnCheckout: UIButton!
    @IBOutlet weak var lbSubtotalItem: UILabel!
    @IBOutlet weak var lbTotal: UILabel!
    @IBOutlet weak var lbSubTotal: UILabel!
    @IBOutlet weak var lbTax: UILabel!
    
    var indexPath: IndexPath!
    weak var delegate: FooterCellDelegate?
    
    var product: Product? {
        didSet {
            if let product = product {
                lbTax.text = "$0.0"
                lbTotal.text = "$\(String(describing: product.total))"
                lbSubTotal.text = "$\(String(describing: product.total))"
                lbSubtotalItem.text = "Subtotal (\(String(describing: product.totalItem)) items)"
                btnCheckout.setTitle("Check Out (\(String(describing: product.totalItem)))", for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        boundaryView.boundary(color: UIColor.lightGray)
        btnCheckout.boundaryWithBackground(color: UIColor.orange)
    }
    
    @IBAction func onCheckoutAction(_ sender: Any) {
        delegate?.onCheckoutAction()
    }
    
}
