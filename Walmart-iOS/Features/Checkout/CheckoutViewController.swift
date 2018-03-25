//
//  CheckoutViewController.swift
//  Walmart-iOS
//
//  Created by TriNgo on 3/13/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {

    @IBOutlet weak var tfCardNumber: UITextField!
    @IBOutlet weak var tfExpiredDate: UITextField!
    @IBOutlet weak var tfCvv: UITextField!
    
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tfCardNumber.becomeFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ThankViewController", let thankViewController = segue.destination as? ThankViewController {
            thankViewController.products = products
        }
    }
}
