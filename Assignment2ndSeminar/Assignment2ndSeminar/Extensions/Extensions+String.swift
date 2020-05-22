//
//  Extensions+String.swift
//  Assignment2ndSeminar
//
//  Created by elesahich on 2020/05/20.
//  Copyright © 2020 elesahich. All rights reserved.
//

import Foundation

extension String {
    
    func removeCharacters(from forbiddenChars: CharacterSet) -> String {
           let passed = self.unicodeScalars.filter { !forbiddenChars.contains($0) }
           return String(String.UnicodeScalarView(passed))
    }
    
    func validateEmail() -> Bool {
        let emailRegEx = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        return predicate.evaluate(with: self)
    }
    
    func validatePasswd() -> Bool {
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        
        return predicate.evaluate(with: self)
    }
}
