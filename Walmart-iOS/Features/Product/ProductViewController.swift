//
//  ProductViewController.swift
//  Walmart-iOS
//
//  Created by TriNgo on 3/13/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import UIKit
import ObjectMapper

class ProductViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let ProductCellReuseIdentifier = "ProductCellReuseIdentifier"
    private var dataSources: [Product] = []
    private var isCheckmarkType = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        ProductManager.shared.isReset = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        setupData()
    }
    
    private func setupData() {
        if ProductManager.shared.isReset {
            ProductManager.shared.isReset = false
            let mapper = Mapper<ProductResponse>()
            let productsData = StubResponse.fromJSONFile("products")
            if let productsJSON = try! JSONSerialization.jsonObject(with: productsData, options: []) as? [String: Any] {
                guard let productResponse = mapper.map(JSON: productsJSON) else { return }
                dataSources = productResponse.products ?? []
                tableView.reloadData()
                ProductManager.shared.products = dataSources
            }
        } else {
            dataSources = ProductManager.shared.products
            tableView.reloadData()
        }
    }
    
    private func setupView() {
        registerCell()
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    private func registerCell() {
        tableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: ProductCellReuseIdentifier)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CartViewController", let cartViewController = segue.destination as? CartViewController {
            cartViewController.dataSources = ProductManager.shared.loadCartItems()
        }
    }
}

extension ProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ProductCellReuseIdentifier, for: indexPath) as? ProductCell {
            cell.delegate = self
            cell.indexPath = indexPath
            cell.product = dataSources[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}

extension ProductViewController: ProductCellDelegate {
    func addToCart(indexPath: IndexPath) {
        let products = ProductManager.shared.products
        products[indexPath.row].isSelected = dataSources[indexPath.row].isSelected ? false : true
        products[indexPath.row].quantity = 1
        ProductManager.shared.save(newProducts: products)
            
        dataSources = ProductManager.shared.products
        tableView.reloadData()
    }
}
