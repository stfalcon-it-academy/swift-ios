//
//  ViewController.swift
//  AllValidationClassDemo
//
//  Created by msm72 on 6/19/16.
//  Copyright © 2016 msm72. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Validation E-mail
        let validation = Validation()
        let isEmailValid = validation.isEmailValid(email: "msm72_mail.ru")
        print("1. Entered E-mail \"msm72_mail.ru\" is valid? - \(isEmailValid)")
        
        // Validation phone
        let isPhoneValid = validation.isPhoneValid(phone: "093-291-8165")
        print("2. Entered phone number \"+380932918165\" is valid? - \(isPhoneValid)")
        
        // Validation pincode
        let isPincodeValid = Validation.isPincodeValid(pincode: "3432")
        print("3. Entered pincode \"3432\" is valid? - \(isPincodeValid)")
        
        // Validation password
        let isPasswordValid = Validation.isPasswordValid("qwerty", confirmPassword: "qwertY")
        print("4. Entered password \"qwerty\" is valid? - \(isPasswordValid)")
        
        // Validation password length
        let isPasswordLengthValid = Validation.isPasswordLenthValid("qwerty", confirmPassword: "qwert")
        print("5. Entered password \"qwerty\" length is valid? - \(isPasswordLengthValid)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

