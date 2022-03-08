//
//  Strings+Extensions.swift
//  SomosMasApp
//
//  Created by Rodrigo Torres on 30/01/2022.
//

import Foundation

extension String {
    
    var removeEspecialCharacters: String {
            let testStringReplacedOccurences = self.replacingOccurrences(of: "<p>",
                                                                         with: "").replacingOccurrences(of: "</p>", with: "").replacingOccurrences(of: "&nbsp;", with: "")
            return testStringReplacedOccurences
        }
    
    var isValidUser: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^(?=.{2,100}$)[A-Za-zÀ-ú][A-Za-zÀ-ú.'-]+(?: [A-Za-zÀ-ú.'-]+)* *$").evaluate(with: self)
    }
    
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$").evaluate(with: self)
    }
    
    var isValidConfirmPassword: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$").evaluate(with: self)
    }
    
    var isValidPhone: Bool {
        let PHONE_REGEX = "^[0-9]{8,11}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: self)
        return result
    }
}
