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
        
        let mapper = Mapper<ProductResponse>()
        let productsData = StubResponse.fromJSONFile("products")
        if let productsJSON = try! JSONSerialization.jsonObject(with: productsData, options: []) as? [String: Any] {
            guard let productResponse = mapper.map(JSON: productsJSON) else { return }
            dataSources = productResponse.products ?? []
            tableView.reloadData()
        }
    }
    
    private func setupView() {
        registerCell()
        tableView.delegate = self
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
            cartViewController.dataSources = dataSources.filter { $0.isSelected }
        }
    }
}

extension ProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ProductCellReuseIdentifier, for: indexPath) as? ProductCell {
            cell.product = dataSources[indexPath.row]
            cell.accessoryType = dataSources[indexPath.row].isSelected ? .checkmark : .none
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
}

extension ProductViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataSources[indexPath.row].isSelected = !dataSources[indexPath.row].isSelected
        dataSources[indexPath.row].quantity = 1
        tableView.reloadData()
    }
}
