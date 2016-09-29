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
protocol ___FILEBASENAMEASIDENTIFIER___InteractorInput {
    func doSomething(request: ___FILEBASENAMEASIDENTIFIER___Request)
}

protocol ___FILEBASENAMEASIDENTIFIER___InteractorOutput {
    func presentSomething(response: ___FILEBASENAMEASIDENTIFIER___Response)
}

class ___FILEBASENAMEASIDENTIFIER___Interactor: ___FILEBASENAMEASIDENTIFIER___InteractorInput {
    // MARK: - Properties
    var output: ___FILEBASENAMEASIDENTIFIER___InteractorOutput!
    var worker: ___FILEBASENAMEASIDENTIFIER___Worker!
  
    
    // MARK: - Business logic
    func doSomething(request: ___FILEBASENAMEASIDENTIFIER___Request) {
        // NOTE: Create some Worker to do the work
        worker = ___FILEBASENAMEASIDENTIFIER___Worker()
        worker.doSomeWork()
    
        // NOTE: Pass the result to the Presenter
        let response = ___FILEBASENAMEASIDENTIFIER___Response()
    
        output.presentSomething(response)
  }
}

