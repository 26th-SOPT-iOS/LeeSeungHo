//
//  ViewController.swift
//  Assignment1stSeminar
//
//  Created by elesahich on 2020/04/18.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func sendFirstView(_ sender: Any) {
        
        guard let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC else { return }
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @IBAction func sendSecondView(_ sender: Any) {
        
        guard let thirdVC = self.storyboard?.instantiateViewController(withIdentifier: "ThirdVC") as? ThirdVC else { return }
        self.navigationController?.pushViewController(thirdVC, animated: true)
    }
}

