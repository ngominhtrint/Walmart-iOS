//
//  ThankViewController.swift
//  Walmart-iOS
//
//  Created by TriNgo on 3/13/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import UIKit

class ThankViewController: UITableViewController {

    @IBOutlet weak var lbSubTotalItem: UILabel!
    @IBOutlet weak var lbSubTotalPrice: UILabel!
    @IBOutlet weak var lbTotalPrice: UILabel!
    @IBOutlet weak var btnContinueShopping: UIButton!
    @IBOutlet weak var btnOrderStatus: UIButton!
    @IBOutlet weak var shippingInfoView: UIView!
    @IBOutlet weak var orderSummaryView: UIView!
    
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    private func setupView() {
        btnContinueShopping.boundary(color: UIColor(red: 19/255, green: 125/255, blue: 193/255, alpha: 1.0))
        btnOrderStatus.boundary(color: UIColor(red: 19/255, green: 125/255, blue: 193/255, alpha: 1.0))
        shippingInfoView.boundary(color: UIColor.lightGray)
        orderSummaryView.boundary(color: UIColor.lightGray)
        
        if let product = products.first {
            lbSubTotalItem.text = "Subtotal (\(product.totalItem) items)"
            lbSubTotalPrice.text = "$\(String(describing: product.total))"
            lbTotalPrice.text = "$\(String(describing: product.total))"
        }
    }
    
    @IBAction func onContinueShoppingClicked(_ sender: Any) {
        ProductManager.shared.isReset = true
        tabBarController?.selectedIndex = 0
        navigationController?.popToRootViewController(animated: true)
    }
}
