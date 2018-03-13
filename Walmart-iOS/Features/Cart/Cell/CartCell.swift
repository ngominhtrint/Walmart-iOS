//
//  CartCell.swift
//  Walmart-iOS
//
//  Created by TriNgo on 3/13/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import UIKit
import AlamofireImage

protocol CartCellDelegate: class {
    func onQuantityIncreased(indexPath: IndexPath)
    func onQuantityDecreased(indexPath: IndexPath)
}

class CartCell: UITableViewCell {

    @IBOutlet weak var ivProduct: UIImageView!
    @IBOutlet weak var lbCurrentPrice: UILabel!
    @IBOutlet weak var lbOriginPrice: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbShipping: UILabel!
    @IBOutlet weak var lbQuantity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    weak var delegate: CartCellDelegate?
    var indexPath: IndexPath!
    var product: Product? {
        didSet {
            if let product = product, let photoPath = product.photo, let imageUrl = URL.init(string: photoPath),
                let currentPrice = product.currentPrice, let originPrice = product.originPrice {
                ivProduct.af_setImage(withURL: imageUrl)
                lbCurrentPrice.text = "$\(currentPrice)"
                lbName.text = product.name ?? ""
                lbShipping.text = product.ship ?? ""
                lbOriginPrice.text = originPrice == currentPrice ? "" : "was $\(originPrice)"
                lbQuantity.text = String(describing: product.quantity)
            }
        }
    }
    
    @IBAction func onAddClicked(_ sender: Any) {
        delegate?.onQuantityIncreased(indexPath: indexPath)
    }
    
    @IBAction func onSubstractClicked(_ sender: Any) {
        delegate?.onQuantityDecreased(indexPath: indexPath)
    }
}
