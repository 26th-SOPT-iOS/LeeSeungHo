//
//  SignUpVC.swift
//  Assignment2ndSeminar
//
//  Created by elesahich on 2020/04/27.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet var txtFields: [UITextField]!
    @IBOutlet weak var signUpButton: UIButton!
    var loginDelegate: signUpAndAutoLoginDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layerSettings()
        setNavigationBarLooksLike()
    }
    
    @IBAction func signUpComplete (_ button: UIButton) {
        
        guard let id = txtFields[0].text else { return }
        guard let pwd = txtFields[1].text else { return }
        guard let name = txtFields[2].text else { return }
        guard let email = txtFields[3].text else { return }
        guard let phone = txtFields[4].text else { return }
        
        SignUpService.signupservice.signUp(id: id, pwd: pwd, name: name, email: email, phone: phone) { networkResult in
            
            switch networkResult {
            case .success:
                NotificationCenter.default.post(name: NSNotification.Name("completeSignUp"), object: nil, userInfo: ["id": id, "pwd": pwd])
                print("\(id)")
                self.navigationController?.popViewController(animated: true)
                self.loginDelegate?.autoButtonClick(id, pwd)
    
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertController = UIAlertController(title: "회원가입 실패", message: message, preferredStyle: .alert)
                let alertAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertController.addAction(alertAction)
                self.present(alertController, animated: true, completion: nil)
                
            case .pathErr: print("")
            case .serverErr: print("")
            case .networkFail: print("")
            }
            
        }
    }
    
    //MARK:- UI Logic
    
    func layerSettings() {
        
        for i in 0..<txtFields.count {
            txtFields[i].backgroundColor = UIColor.calculatorColor(.signUpAndInColor)
            txtFields[i].layer.cornerRadius = 20
            txtFields[i].layer.borderWidth = 1
            txtFields[i].layer.borderColor = UIColor.white.cgColor
            txtFields[i].clipsToBounds = true
            txtFields[i].setLeftPaddingPoints(10)
            
            txtFields[0].placeholder = "아이디"
            txtFields[1].placeholder = "비밀번호"
            txtFields[2].placeholder = "이름"
            txtFields[3].placeholder = "이메일"
            txtFields[4].placeholder = "핸드폰 번호"
            
            
        }
        signUpButton.layer.cornerRadius = 20
        signUpButton.layer.borderWidth = 1
        signUpButton.layer.borderColor = UIColor.white.cgColor
        signUpButton.clipsToBounds = true
        signUpButton.layer.backgroundColor = UIColor.calculatorColor(.soptColor).cgColor
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        signUpButton.setTitle("가입완료", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        
    }
    
    func setNavigationBarLooksLike() {
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        
        let backIndicator: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "backIndicator"), style: .plain, target: self, action: #selector(dismissVC))
        
        navigationBar.isTranslucent = false
        navigationBar.backgroundColor = UIColor.clear
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        navigationItem.leftBarButtonItem = backIndicator
    }
    
    @objc func dismissVC() {
        self.navigationController?.popViewController(animated: true)
    }
}

