//
//  ProductCell.swift
//  Walmart-iOS
//
//  Created by TriNgo on 3/13/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import UIKit
import AlamofireImage

protocol ProductCellDelegate: class {
    func addToCart(indexPath: IndexPath)
}

class ProductCell: UITableViewCell {

    @IBOutlet weak var ivProduct: UIImageView!
    @IBOutlet weak var lbCurrentPrice: UILabel!
    @IBOutlet weak var lbOriginPrice: UILabel!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbShipping: UILabel!
    @IBOutlet weak var btnAddToCart: UIButton!
    
    private let blue = UIColor(red: 19/255, green: 125/255, blue: 193/255, alpha: 1.0)
    private let green = UIColor(red: 0, green: 128/255, blue: 0, alpha: 1.0)
    
    weak var delegate: ProductCellDelegate?
    var indexPath: IndexPath!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
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
                btnAddToCart.setTitle(product.isSelected ? "Added" : "Add to Cart", for: .normal)
                btnAddToCart.backgroundColor = product.isSelected ? green : blue
            }
        }
    }
    
    @IBAction func onAddToCartClicked(_ sender: Any) {
        delegate?.addToCart(indexPath: indexPath)
    }
}
