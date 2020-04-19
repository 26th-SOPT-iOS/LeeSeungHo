//
//  FourthVC.swift
//  Assignment1stSeminar
//
//  Created by elesahich on 2020/04/18.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class FourthVC: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        guard let loginVC = self.storyboard?.instantiateViewController(identifier: "SixthVC") as? SixthVC else { return }
        
        loginVC.name = idTextField.text
        loginVC.passwd = pwdTextField.text
        
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true, completion: nil)
        
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
        guard let signUpVC = self.storyboard?.instantiateViewController(identifier: "FifthVC") as? FifthVC else { return }
        //
        //        vc.modalPresentationStyle = .fullScreen
        //        self.present(vc, animated: true)
        self.navigationController?.pushViewController(signUpVC, animated: true)
        
    }
}


