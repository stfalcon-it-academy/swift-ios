//
//  ViewController.swift
//  UIAlertController Example
//
//  Created by syncmac on 22/03/15.
//  Copyright (c) 2015 SourceFreeze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    
    // MARK: - Actions
    @IBAction func alertControllerAction(sender: AnyObject) {
        switch sender.tag {
        // Insert UIAlertController with TextField code here..
        case 1:
            var loginTextField: UITextField?
            let alertController = UIAlertController(title: "UIAlertController", message: "UIAlertController With TextField", preferredStyle: .Alert)
            
            let ok = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                print("Ok Button Pressed")
            })
            
            let cancel = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
                print("Cancel Button Pressed")
            }
            
            alertController.addAction(ok)
            alertController.addAction(cancel)
            
            // Add text field handler
            alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
                // Enter the textfiled customization code here.
                loginTextField = textField
                loginTextField?.placeholder = "Enter your login ID"
            }
            
            presentViewController(alertController, animated: true, completion: nil)
            
        // Insert UIAlertController with LoginForm code here..
        case 2:
            var loginTextField: UITextField?
            var passwordTextField: UITextField?
            let alertController = UIAlertController(title: "UIAlertController", message: "UIAlertController With TextField", preferredStyle: .Alert)
            
            let ok = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                print("Ok Button Pressed")
            })
            
            let cancel = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
                print("Cancel Button Pressed")
            }
            
            alertController.addAction(ok)
            alertController.addAction(cancel)
            
            alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
                // Enter the textfiled customization code here.
                loginTextField = textField
                loginTextField?.placeholder = "User ID"
                loginTextField?.keyboardType = .ASCIICapable
            }
            
            alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
                // Enter the textfiled customization code here.
                passwordTextField = textField
                passwordTextField?.placeholder = "Password"
                passwordTextField?.secureTextEntry = true
            }
            
            presentViewController(alertController, animated: true, completion: nil)

        // UIAlertController With Multiple Buttons code here..
        case 3:
            let alertController = UIAlertController(title: "UIAlertController", message: "UIAlertController with multiple buttons", preferredStyle: .Alert)
            
            let buttonOne = UIAlertAction(title: "One", style: .Default, handler: { (action) -> Void in
                print("Button One Pressed")
            })
            
            let buttonTwo = UIAlertAction(title: "Two", style: .Default, handler: { (action) -> Void in
                print("Button Two Pressed")
            })
            
            let buttonThree = UIAlertAction(title: "Three", style: .Default, handler: { (action) -> Void in
                print("Button Three Pressed")
            })
            
            let buttonFour = UIAlertAction(title: "Four", style: .Default, handler: { (action) -> Void in
                print("Button Four Pressed")
            })
            
            let buttonCancel = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
                print("Cancel Button Pressed")
            }
            
            alertController.addAction(buttonOne)
            alertController.addAction(buttonTwo)
            alertController.addAction(buttonThree)
            alertController.addAction(buttonFour)
            alertController.addAction(buttonCancel)
            
            presentViewController(alertController, animated: true, completion: nil)

        // Standard UIActionSheet code here..
        case 4:
            let alertController = UIAlertController(title: "UIActionSheet", message: "UIActionSheet", preferredStyle: .ActionSheet)
            
            let ok = UIAlertAction(title: "Ok", style: .Default, handler: { (action) -> Void in
                print("Ok Button Pressed")
            })
            
            let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: { (action) -> Void in
                print("Cancel Button Pressed")
            })
            
            let  delete = UIAlertAction(title: "Delete", style: .Destructive) { (action) -> Void in
                print("Delete Button Pressed")
            }
            
            alertController.addAction(ok)
            alertController.addAction(cancel)
            alertController.addAction(delete)
            
            presentViewController(alertController, animated: true, completion: nil)
            
        // Insert Simple UIAlertController code here..
        default:
            let alertController = UIAlertController(title: "Default AlertController", message: "A standard alert", preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action:UIAlertAction) in
                print("you have pressed the Cancel button");
            }
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action:UIAlertAction) in
                print("you have pressed OK button");
            }
            
            alertController.addAction(cancelAction)
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true, completion:nil)
        }
    }
}

