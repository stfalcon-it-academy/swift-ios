//
//  Validation.swift
//  AllValidationClassDemo
//
//  Created by msm72 on 6/19/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class Validation: NSObject {
    // MARK: - Class Functions
    // Pincode validation.
    class func isPincodeValid(pincode codeValue: String) -> Bool {
        if codeValue.characters.count <= 4 {
            return true
        } else {
            return false
        }
    }
    
    // Password Validation : Check current and confirm is same.
    class func isPasswordValid(password: String, confirmPassword: String) -> Bool {
        if password == confirmPassword{
            return true
        } else {
            return false
        }
    }
    
    // Password length validation: length should grater than 7.
    class func isPasswordLenthValid(password: String, confirmPassword: String) -> Bool {
        if password.characters.count <= 7 && confirmPassword.characters.count <= 7 && isPasswordValid(password, confirmPassword: confirmPassword) {
            return true
        } else {
            return false
        }
    }
    
    // Email Validation.
    func isEmailValid(email emailValue: String) -> Bool {
        print("validate email: \"\(emailValue)\"")
        
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        
        let emailCheck = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        let result = emailCheck.evaluateWithObject(emailValue)
        
        return result
    }
    
    // Phone Number validation.
    func isPhoneValid(phone phoneValue: String) -> Bool {
        let phoneRegEx = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        let result =  phoneTest.evaluateWithObject(phoneValue)
        
        return result
    }
}
