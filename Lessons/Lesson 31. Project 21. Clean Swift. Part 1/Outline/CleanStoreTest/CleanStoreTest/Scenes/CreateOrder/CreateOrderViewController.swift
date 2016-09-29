//
//  CreateOrderViewController.swift
//  CleanStoreTest
//
//  Created by msm72 on 05.08.16.
//  Copyright (c) 2016 Monastyrskiy Sergey. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol CreateOrderViewControllerInput
{
  func displaySomething(viewModel: CreateOrderViewModel)
}

protocol CreateOrderViewControllerOutput
{
  func doSomething(request: CreateOrderRequest)
}


class CreateOrderViewController: UITableViewController, CreateOrderViewControllerInput
{
  var output: CreateOrderViewControllerOutput!
  var router: CreateOrderRouter!
  
  // MARK: Object lifecycle
  
  override func awakeFromNib()
  {
    super.awakeFromNib()
    CreateOrderConfigurator.sharedInstance.configure(self)
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    doSomethingOnLoad()
  }
  
  // MARK: Event handling
  
  func doSomethingOnLoad()
  {
    // NOTE: Ask the Interactor to do some work
    
    let request = CreateOrderRequest()
    output.doSomething(request)
  }
  
  // MARK: Display logic
  
  func displaySomething(viewModel: CreateOrderViewModel)
  {
    // NOTE: Display the result from the Presenter
    
    // nameTextField.text = viewModel.name
  }
}
