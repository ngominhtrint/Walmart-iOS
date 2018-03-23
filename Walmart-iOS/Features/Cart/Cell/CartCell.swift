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
    func onRemoveAction(indexPath: IndexPath)
    func onPickQuantity(indexPath: IndexPath)
}

class CartCell: UITableViewCell {

    @IBOutlet weak var ivProduct: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbSoldBy: UILabel!
    @IBOutlet weak var lbShipping: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var btnQuantity: UIButton!
    @IBOutlet weak var btnSaveLater: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnQuantity.boundary(color: UIColor(red: 19/255, green: 125/255, blue: 193/255, alpha: 1))
        btnSaveLater.boundary(color: UIColor(red: 19/255, green: 125/255, blue: 193/255, alpha: 1))
    }
    
    weak var delegate: CartCellDelegate?
    var indexPath: IndexPath!
    var product: Product? {
        didSet {
            if let product = product, let photoPath = product.photo, let imageUrl = URL.init(string: photoPath),
                let currentPrice = product.currentPrice {
                ivProduct.af_setImage(withURL: imageUrl)
                lbName.text = product.name ?? ""
                lbShipping.text = product.ship ?? ""
                lbPrice.text = "$\(String(describing: currentPrice))"
            }
        }
    }
    
    @IBAction func onPickQuantity(_ sender: Any) {
        delegate?.onPickQuantity(indexPath: indexPath)
    }
    
    @IBAction func onRemoveAction(_ sender: Any) {
        delegate?.onRemoveAction(indexPath: indexPath)
    }
    
    @IBAction func onAddClicked(_ sender: Any) {
        delegate?.onQuantityIncreased(indexPath: indexPath)
    }
    
    @IBAction func onSubstractClicked(_ sender: Any) {
        delegate?.onQuantityDecreased(indexPath: indexPath)
    }
}
