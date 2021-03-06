//
//  DeleteOrderInteractor.swift
//  CleanStoreTest
//
//  Created by msm72 on 05.08.16.
//  Copyright (c) 2016 Monastyrskiy Sergey. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol DeleteOrderInteractorInput
{
  func doSomething(request: DeleteOrderRequest)
}

protocol DeleteOrderInteractorOutput
{
  func presentSomething(response: DeleteOrderResponse)
}

class DeleteOrderInteractor: DeleteOrderInteractorInput
{
  var output: DeleteOrderInteractorOutput!
  var worker: DeleteOrderWorker!
  
  // MARK: Business logic
  
  func doSomething(request: DeleteOrderRequest)
  {
    // NOTE: Create some Worker to do the work
    
    worker = DeleteOrderWorker()
    worker.doSomeWork()
    
    // NOTE: Pass the result to the Presenter
    
    let response = DeleteOrderResponse()
    output.presentSomething(response)
  }
}
