//
//  LoginVC.swift
//  Assignment2ndSeminar
//
//  Created by elesahich on 2020/04/27.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet var txtFields: [UITextField]!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButtonsLooksLike()
        setNavigationBarLooksLike()
    }
    
    //MARK:- Button Action Settings
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "TabbarController") else { return }
        vc.modalPresentationStyle = .currentContext
        present(vc, animated: true)
    }
    
    //MARK:- UI Settings
    func setNavigationBarLooksLike() {
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        navigationBar.isTranslucent = false
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        
    }
    func setButtonsLooksLike() {
        
        for i in 0..<txtFields.count {
            txtFields[i].backgroundColor = UIColor.calculatorColor(.signUpAndInColor)
            txtFields[i].layer.cornerRadius = 20
            txtFields[i].layer.borderWidth = 1
            txtFields[i].layer.borderColor = UIColor.white.cgColor
            txtFields[i].clipsToBounds = true
            txtFields[0].placeholder = "   이메일"
            txtFields[1].placeholder = "   비밀번호"
            txtFields[1].isSecureTextEntry = true
        }
        
        loginButton.layer.cornerRadius = 20
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.clipsToBounds = true
        loginButton.layer.backgroundColor = UIColor.calculatorColor(.soptColor).cgColor
        loginButton.setTitle("로그인", for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        loginButton.setTitleColor(.white, for: .normal)
    }
}


