//
//  FriendVC.swift
//  Assignment2ndSeminar
//
//  Created by elesahich on 2020/05/10.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class FriendVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
 
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension FriendVC: UITableViewDelegate {
    
    
}

extension FriendVC: UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
