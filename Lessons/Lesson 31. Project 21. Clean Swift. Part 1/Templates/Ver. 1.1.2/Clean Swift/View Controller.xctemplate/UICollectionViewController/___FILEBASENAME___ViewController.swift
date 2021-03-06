//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Input & Output protocols
protocol ___FILEBASENAMEASIDENTIFIER___ViewControllerInput {
    func displaySomething(viewModel: ___FILEBASENAMEASIDENTIFIER___ViewModel)
}

protocol ___FILEBASENAMEASIDENTIFIER___ViewControllerOutput {
    func doSomething(request: ___FILEBASENAMEASIDENTIFIER___Request)
}


class ___FILEBASENAMEASIDENTIFIER___ViewController: UICollectionViewController {
    // MARK: - Properties
    var output: ___FILEBASENAMEASIDENTIFIER___ViewControllerOutput!
    var router: ___FILEBASENAMEASIDENTIFIER___Router!
  
  
    // MARK: - Class Functions
    override func awakeFromNib() {
        super.awakeFromNib()
    
        ___FILEBASENAMEASIDENTIFIER___Configurator.sharedInstance.configure(self)
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
    
        doSomethingOnLoad()
    }
  
  
    // MARK: - Custom Functions
    func doSomethingOnLoad() {
        // NOTE: Ask the Interactor to do some work
        let request = ___FILEBASENAMEASIDENTIFIER___Request()
    
        output.doSomething(request)
    }
}


// MARK: - ___FILEBASENAMEASIDENTIFIER___ViewControllerInput
extension ___FILEBASENAMEASIDENTIFIER___ViewController: ___FILEBASENAMEASIDENTIFIER___ViewControllerInput {
    func displaySomething(viewModel: ___FILEBASENAMEASIDENTIFIER___ViewModel) {
        // NOTE: Display the result from the Presenter
        
        // nameTextField.text = viewModel.name
    }
}

