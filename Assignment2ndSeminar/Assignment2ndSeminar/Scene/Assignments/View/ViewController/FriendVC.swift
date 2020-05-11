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
    
    var friends: [Friends] = []
    func setFriendsList() {
        let friends1 = Friends(name: "승호", profileImage: "temp", subTitle: "assad")
        let friends2 = Friends(name: "이솝트", profileImage: "1-1", subTitle: "sadd")
        let friends3 = Friends(name: "박솝트", profileImage: "2", subTitle: "sadasd")
        let friends4 = Friends(name: "김솝트", profileImage: "3", subTitle: "sadd")
        let friends5 = Friends(name: "강솝트", profileImage: "4", subTitle: "")
        let friends6 = Friends(name: "이솝트", profileImage: "5", subTitle: "")
        let friends7 = Friends(name: "박솝트", profileImage: "6", subTitle: "")
        let friends8 = Friends(name: "김솝트", profileImage: "7", subTitle: "")
        let friends9 = Friends(name: "강솝트", profileImage: "8", subTitle: "")
        let friends10 = Friends(name: "이솝트", profileImage: "9", subTitle: "")
        let friends11 = Friends(name: "박솝트", profileImage: "10", subTitle: "")
        
        friends = [friends1, friends2, friends3, friends4, friends5, friends6, friends7, friends8, friends9, friends10, friends11]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setFriendsList()
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        navigationBar.isTranslucent = false
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        
        let settingsButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "correct"), style: .plain, target: self, action: #selector(alertViewFriendSettings))
        
        let longTitleLabel = UILabel()
        longTitleLabel.text = "친구"
        longTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        longTitleLabel.sizeToFit()
        
        let leftItem = UIBarButtonItem(customView: longTitleLabel)
        
        navigationItem.leftBarButtonItem = leftItem
        navigationItem.rightBarButtonItem = settingsButton
    }
    
    @objc func alertViewFriendSettings() {
        showAlert(style: .actionSheet)
    }
    
    func showAlert(style: UIAlertController.Style) {
        let alert = UIAlertController(title: "알림", message: "내용", preferredStyle: style)
        let success = UIAlertAction(title: "확인", style: .default) { (action) in
            print("확인")
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let destructive = UIAlertAction(title: "삭제", style: .destructive)
        
        alert.addAction(success)
        alert.addAction(cancel)
        alert.addAction(destructive)
        
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Delegates

extension FriendVC: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 88
        } else {
            return 66
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else {
            return friends.count-1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 0
        } else {
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            friends.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            
        } else if editingStyle == .insert {
            
        }
    }
}
// MARK: - DataSource

extension FriendVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as? ProfileCell  else { return UITableViewCell() }
        
        if indexPath.section == 0 {
            cell.settings(friends[0])
            cell.profileImage.layer.cornerRadius = cell.profileImage.frame.height/2
            cell.underBar.alpha = 0

            return cell
        } else {
            cell.settings(friends[indexPath.item+1])
            cell.underBar.alpha = 0
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
        
        let headerLabel = UILabel()
        let numberOfFriendLabel = UILabel()
        
        headerLabel.text = "친구 "
        headerLabel.font = UIFont.systemFont(ofSize: 12)
        headerLabel.frame = CGRect.init(x: 15, y: 0, width: 50, height: 30)
        
        numberOfFriendLabel.text = "\(friends.count-1)"
        numberOfFriendLabel.font = UIFont.systemFont(ofSize: 12)
        numberOfFriendLabel.frame = CGRect.init(x: 40, y: 0, width: 50, height: 30)
        
        view.addSubview(headerLabel)
        view.addSubview(numberOfFriendLabel)
        
        return view
    }
}

