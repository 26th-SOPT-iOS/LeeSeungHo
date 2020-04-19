//
//  FifthVC.swift
//  Assignment1stSeminar
//
//  Created by elesahich on 2020/04/18.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class FifthVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
        guard let vc = storyboard?.instantiateViewController(identifier: "SixthVC") as? SixthVC else { return }
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
    
}
