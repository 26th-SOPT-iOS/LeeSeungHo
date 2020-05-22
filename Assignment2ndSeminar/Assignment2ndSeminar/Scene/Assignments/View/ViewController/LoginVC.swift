//
//  LoginVC.swift
//  Assignment2ndSeminar
//
//  Created by elesahich on 2020/04/27.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit
import BEMCheckBox

protocol signUpAndAutoLoginDelegate {
    func autoButtonClick(_ id: String, _ pwd: String)
}

class LoginVC: UIViewController, signUpAndAutoLoginDelegate {
    
    @IBOutlet var txtFields: [UITextField]!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailValidateLabel: UILabel!
    @IBOutlet weak var pwdValidateLabel: UILabel!
    @IBOutlet weak var autoLoginButton: BEMCheckBox!
    var receptDelegate: signUpAndAutoLoginDelegate!
    
    func autoLogin() {
        if let userId = UserDefaults.standard.string(forKey: "id") {
            let uid = userId
            guard let pwd = UserDefaults.standard.string(forKey: "pwd") else { return }
            
            autoButtonClick(uid, pwd)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        emailValidateLabel.text = nil
        pwdValidateLabel.text = nil
        
        autoLogin()
        setButtonsLooksLike()
        setNavigationBarLooksLike()
        autoLoginButton.setOn(false, animated: true)
    }
    
    // Delegates
    func autoButtonClick(_ id: String, _ pwd: String)
    {
        txtFields[0].text = id
        txtFields[1].text = pwd
        loginButton.sendActions(for: .touchUpInside)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "signUpSegue" {
            var vc = storyboard?.instantiateViewController(identifier: "SignUpVC") as? SignUpVC
            vc = segue.destination as? SignUpVC
            vc?.loginDelegate = self
        }
    }
    
    //MARK:- Button Action Settings
    @IBAction func loginButton(_ sender: UIButton) {
        
        guard let inputID = txtFields[0].text else { return }
        guard let inputPWD = txtFields[1].text else { return }
        
        txtFields[0].text = nil
        txtFields[1].text = nil
        
        LoginService.shared.login(id: inputID, pwd: inputPWD) { networkResult in
            switch networkResult {
                
            case .success(let token):
                guard let token = token as? String else { return }
                print("1312321");
                
                UserDefaults.standard.set(token, forKey: "token")
                print("token : \(token)")
                if self.autoLoginButton.on {
                    UserDefaults.standard.set(inputID, forKey: "id")
                    UserDefaults.standard.set(inputPWD, forKey: "pwd")
                }
                
                guard let tabbarController = self.storyboard?.instantiateViewController(identifier:
                    "TabbarController") as? UITabBarController else { return }
                
                tabbarController.modalPresentationStyle = .fullScreen
                self.present(tabbarController, animated: true, completion: nil)
                
            case .requestErr(let message):
                
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "로그인 실패", message: message,
                                                            preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                print("err")
                self.present(alertViewController, animated: true, completion: nil)
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
            }
        }
    }
    
    @objc func textFieldDidChage(_ textField: UITextField) {
        emailValidateLabel.alpha = txtFields[0].text?.validateEmail() == false ? 1 : 0
        
        pwdValidateLabel.alpha = txtFields[1].text?.validatePasswd() == false ? 1 : 0
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
            
            txtFields[i].addTarget(self, action: #selector(textFieldDidChage(_:)), for: .editingChanged)
            txtFields[i].backgroundColor = UIColor.calculatorColor(.signUpAndInColor)
            txtFields[i].layer.cornerRadius = 20
            txtFields[i].layer.borderWidth = 1
            txtFields[i].layer.borderColor = UIColor.white.cgColor
            txtFields[i].clipsToBounds = true
            txtFields[i].setLeftPaddingPoints(10)
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


