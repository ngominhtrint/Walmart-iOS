//
//  CartViewController.swift
//  Walmart-iOS
//
//  Created by TriNgo on 3/13/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var lbNoItems: UILabel!
    @IBOutlet weak var tableView: UITableView!

    private let CartCellReuseIdentifier = "CartCellReuseIdentifier"
    private let HeaderCellReuseIdentifier = "HeaderCellReuseIdentifier"
    private let FooterCellReuseIdentifier = "FooterCellReuseIdentifier"
    var dataSources: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupData()
    }
    
    private func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
        registerCell()
    }
    
    private func setupData() {
        dataSources = ProductManager.shared.loadCartItems()
        tableView.reloadData()
        
        lbNoItems.isHidden = dataSources.count != 0
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: "CartCell", bundle: nil), forCellReuseIdentifier: CartCellReuseIdentifier)
        tableView.register(UINib(nibName: "HeaderCell", bundle: nil), forCellReuseIdentifier: HeaderCellReuseIdentifier)
        tableView.register(UINib(nibName: "FooterCell", bundle: nil), forCellReuseIdentifier: FooterCellReuseIdentifier)
    }
    
    private func navigateToCheckout() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let checkoutViewController = storyboard.instantiateViewController(withIdentifier: "CheckoutViewController") as? CheckoutViewController {
            checkoutViewController.products = dataSources
            navigationController?.pushViewController(checkoutViewController, animated: true)
        }
    }
}

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 { //render header cell
            if let headerCell = tableView.dequeueReusableCell(withIdentifier: HeaderCellReuseIdentifier, for: indexPath) as? HeaderCell {
                headerCell.delegate = self
                headerCell.indexPath = indexPath
                headerCell.product = dataSources[indexPath.row]
                headerCell.selectionStyle = .none
                headerCell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                return headerCell
            }
            return UITableViewCell()
        } else if indexPath.row == dataSources.count - 1 { //render footer cell
            if let footerCell = tableView.dequeueReusableCell(withIdentifier: FooterCellReuseIdentifier, for: indexPath) as? FooterCell {
                footerCell.delegate = self
                footerCell.indexPath = indexPath
                footerCell.product = dataSources[indexPath.row]
                footerCell.selectionStyle = .none
                footerCell.separatorInset = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.width, bottom: 0, right: 0)
                return footerCell
            }
            return UITableViewCell()
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: CartCellReuseIdentifier, for: indexPath) as? CartCell {
                cell.delegate = self
                cell.indexPath = indexPath
                cell.product = dataSources[indexPath.row]
                cell.selectionStyle = .none
                cell.separatorInset = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.width, bottom: 0, right: 0)
                return cell
            }
            return UITableViewCell()
        }
    }
}

extension CartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 120.0
        } else if indexPath.row == dataSources.count - 1 {
            return 320.0
        } else {
            return UITableViewAutomaticDimension
        }
    }
}

extension CartViewController: CartCellDelegate {
    
    func onRemoveAction(indexPath: IndexPath) {
        let product = ProductManager.shared.loadCartItems()[indexPath.row]
        for (index, element) in ProductManager.shared.products.enumerated() {
            if element.id == product.id {
                ProductManager.shared.products[index].isSelected = false
                ProductManager.shared.products[index].quantity = 0
            }
        }
        dataSources = ProductManager.shared.loadCartItems()
        
        self.tableView.reloadData()
        lbNoItems.isHidden = dataSources.count != 0
    }
    
    func onPickQuantity(indexPath: IndexPath) {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        // Create custom content viewController
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contentViewController = storyboard.instantiateViewController(withIdentifier: "PickQuantityViewController") as! PickQuantityViewController
        contentViewController.indexPath = indexPath
        contentViewController.delegate = self
        contentViewController.preferredContentSize = contentViewController.view.bounds.size
        alertController.setValue(contentViewController, forKey: "contentViewController")
        present(alertController, animated: true, completion: nil)
    }
}

extension CartViewController: PickQuantityViewControllerDelegate {
    func onPick(quantity: Int, indexPath: IndexPath) {
        let product = ProductManager.shared.loadCartItems()[indexPath.row]
        for (index, element) in ProductManager.shared.products.enumerated() {
            if element.id == product.id {
                ProductManager.shared.products[index].quantity = quantity
            }
        }
        dataSources = ProductManager.shared.loadCartItems()
        self.tableView.reloadData()
    }
}

extension CartViewController: HeaderCellDelegate {
    func onCheckoutAction(indexPath: IndexPath) {
        navigateToCheckout()
    }
}

extension CartViewController: FooterCellDelegate {
    func onCheckoutAction() {
        navigateToCheckout()
    }
}
