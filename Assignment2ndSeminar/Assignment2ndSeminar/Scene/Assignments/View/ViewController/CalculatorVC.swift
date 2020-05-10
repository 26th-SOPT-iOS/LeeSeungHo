//
//  ViewController.swift
//  Assignment2ndSeminar
//
//  Created by elesahich on 2020/04/25.
//  Copyright © 2020 elesahich. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {
    
    @IBOutlet var yellowOperations: [UIButton]!
    @IBOutlet var grayOperations: [UIButton]!
    @IBOutlet var darkGrayNums: [UIButton]!
    
    @IBOutlet weak var digitStackView: UIStackView!
    @IBOutlet weak var displayView: UIView!
    @IBOutlet weak var display: UILabel!
    
    private var brain = CalculateBrain()
    private var userIsIntheMiddleofTyping: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        setButtonLooksLike()
//        setDisplayConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        setButtonLooksLike()
        setDisplayConstraints()

    }
    //MARK:- UI Logic
    func setDisplayConstraints() {
        
        display.translatesAutoresizingMaskIntoConstraints = false
        display.textColor = .white
        display.font = .systemFont(ofSize: 60, weight: .thin)
        
        let constraints = [
            display.leftAnchor.constraint(lessThanOrEqualTo: displayView.leftAnchor, constant: 320),
            display.rightAnchor.constraint(equalTo: displayView .rightAnchor, constant: 0),
            display.bottomAnchor.constraint(equalTo: displayView.bottomAnchor, constant: 10)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    //MARK:- 버튼 : 색으로 구분
    
    func setButtonLooksLike() {
        digitStackView.backgroundColor = .black
        displayView.backgroundColor = .black
        view.backgroundColor = .black
        
        for i in 0..<yellowOperations.count {
            let _: UIButton = {
                let btn = yellowOperations[i]
                btn.titleLabel?.font = UIFont.systemFont(ofSize: 40)
                btn.setTitleColor(.white, for: .normal)
                btn.layer.cornerRadius = btn.frame.height/2 - 4
                btn.layer.borderWidth = 1
                btn.layer.borderColor = UIColor.clear.cgColor
                btn.clipsToBounds = true
                btn.backgroundColor = UIColor.calculatorColor(.orangeColor)
                
                return btn
            }()
        }
        
        for i in 0..<grayOperations.count {
            let _: UIButton = {
                let btn = grayOperations[i]
                btn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
                btn.setTitleColor(.black, for: .normal)
                btn.layer.cornerRadius = btn.frame.height/2	- 4
                btn.layer.borderWidth = 1
                btn.layer.borderColor = UIColor.clear.cgColor
                btn.clipsToBounds = true
                btn.backgroundColor = UIColor.calculatorColor(.defaultGrayColor)
               
                return btn
            }()
        }
        
        for i in 0..<darkGrayNums.count {
            let _: UIButton = {
                let btn = darkGrayNums[i]
                btn.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .regular)
                btn.setTitleColor(.white, for: .normal)
                btn.layer.cornerRadius = btn.frame.height/2 - 4
                btn.layer.borderWidth = 1
                btn.layer.borderColor = UIColor.clear.cgColor
                btn.clipsToBounds = true
                btn.backgroundColor = UIColor.calculatorColor(.darkGrayColor)
                
                return btn
            }()
        }
    }
}

extension CalculatorVC {
    
    //MARK:- Action Logic
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsIntheMiddleofTyping {
            // String(입력) -> Double(formatted) -> String
            
            let textCurrentlyInDisplay = display.text!
            var stringvar = textCurrentlyInDisplay + digit
            let calculateNumber = stringvar.removeCharacters(from: CharacterSet.decimalDigits.inverted)
            
            stringvar = Int(calculateNumber)!.formattedWithSeparator
            display.text = stringvar
            
        } else {
            display.text = digit
        }
        userIsIntheMiddleofTyping = true
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        if userIsIntheMiddleofTyping {
            brain.setOperand(operand: displayValue)
            userIsIntheMiddleofTyping = false
        }
        if let mathmaticalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathmaticalSymbol)
        }
        displayValue = brain.result
    }
    
    private var displayValue: Double  {
        get {
            let str = display.text?.removeCharacters(from: CharacterSet.decimalDigits.inverted)
            return Double(str!)!
        }
        set {
            display.text = String(newValue)
        }
    }
}

