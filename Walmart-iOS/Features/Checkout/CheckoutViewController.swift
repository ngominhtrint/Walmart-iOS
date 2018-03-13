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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        tfCardNumber.becomeFirstResponder()
    }
}
