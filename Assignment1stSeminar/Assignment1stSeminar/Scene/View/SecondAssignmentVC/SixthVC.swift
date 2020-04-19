//
//  SixthVC.swift
//  Assignment1stSeminar
//
//  Created by elesahich on 2020/04/18.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class SixthVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var passwdLabel: UILabel!
    
    lazy var name: String? = ""
    lazy var passwd: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabel()
    }
    
    func setLabel() {
        guard let name = self.name else { return }
        guard let passwd = self.passwd else { return }
        
        nameLabel.text = name
        passwdLabel.text = passwd

    }
    
    @IBAction func setBackButton(_ sender: Any) {
        
        guard let firstVC = self.storyboard?.instantiateViewController(identifier: "NaviController") else { return }
        
        self.view.window!.rootViewController = firstVC
        dismiss(animated: true, completion: nil)
        
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
                        self.dismiss(animated: true, completion: nil)
        }, completion: nil)
        
//        dismiss(animated: true) {
//            if let sceneDelegate = UIApplication.shared.delegate as? AppDelegate {
//                (sceneDelegate.window?.rootViewController as? UINavigationController)?.popViewController(animated: true)
//            }
//        }
        
        
    }
}
