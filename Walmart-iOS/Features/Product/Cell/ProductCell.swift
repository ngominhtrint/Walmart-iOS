//
//  ProductCell.swift
//  Walmart-iOS
//
//  Created by TriNgo on 3/13/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import UIKit
import AlamofireImage

class ProductCell: UITableViewCell {

    @IBOutlet weak var ivProduct: UIImageView!
    @IBOutlet weak var lbCurrentPrice: UILabel!
    @IBOutlet weak var lbOriginPrice: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbShipping: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var product: Product? {
        didSet {
            if let product = product, let photoPath = product.photo, let imageUrl = URL.init(string: photoPath),
                let currentPrice = product.currentPrice, let originPrice = product.originPrice {
                ivProduct.af_setImage(withURL: imageUrl)
                lbCurrentPrice.text = "$\(currentPrice)"
                lbName.text = product.name ?? ""
                lbShipping.text = product.ship ?? ""
                lbOriginPrice.text = originPrice == currentPrice ? "" : "was $\(originPrice)"
            }
        }
    }
}
