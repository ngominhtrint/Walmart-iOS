//
//  PickQuantityViewController.swift
//  Walmart-iOS
//
//  Created by TriNgo on 3/24/18.
//  Copyright © 2018 TriNgo. All rights reserved.
//

import UIKit

class PickQuantityViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "NumberCell", bundle: nil), forCellReuseIdentifier: "NumberCell")
    }
}

extension PickQuantityViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NumberCell", for: indexPath) as? NumberCell {
            cell.lbNumber.text = "\(indexPath.row + 1)"
            return cell
        }
        return UITableViewCell()
    }
}
