//
//  PickQuantityViewController.swift
//  Walmart-iOS
//
//  Created by TriNgo on 3/24/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import UIKit

protocol PickQuantityViewControllerDelegate: class {
    func onPick(quantity: Int, indexPath: IndexPath)
}

class PickQuantityViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: PickQuantityViewControllerDelegate?
    var indexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "NumberCell", bundle: nil), forCellReuseIdentifier: "NumberCell")
    }
}

extension PickQuantityViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NumberCell", for: indexPath) as? NumberCell {
            cell.lbNumber.text = "\(indexPath.row + 1)"
            return cell
        }
        return UITableViewCell()
    }
}

extension PickQuantityViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.onPick(quantity: indexPath.row + 1, indexPath: self.indexPath!)
        dismiss(animated: true, completion: nil)
    }
}
