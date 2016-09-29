//
//  ListOrdersPresenterTests.swift
//  CleanStore
//
//  Created by Raymond Law on 10/31/15.
//  Copyright (c) 2015 Raymond Law. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

@testable import CleanStore
import XCTest

class ListOrdersPresenterTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: ListOrdersPresenter!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupListOrdersPresenter()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupListOrdersPresenter()
  {
    sut = ListOrdersPresenter()
  }
  
  // MARK: Test doubles
  
  class ListOrdersPresenterOutputSpy: ListOrdersPresenterOutput
  {
    // MARK: Method call expectations
    var displayFetchedOrdersCalled = false
    
    // MARK: Argument expectations
    var viewModel: ListOrders.FetchOrders.ViewModel!
    
    // MARK: Spied methods
    func displayFetchedOrders(viewModel: ListOrders.FetchOrders.ViewModel)
    {
      displayFetchedOrdersCalled = true
      self.viewModel = viewModel
    }
  }
  
  // MARK: Tests
  
  func testPresentFetchedOrdersShouldFormatFetchedOrdersForDisplay()
  {
    // Given
    let listOrdersPresenterOutputSpy = ListOrdersPresenterOutputSpy()
    sut.output = listOrdersPresenterOutputSpy
    
    let dateComponents = NSDateComponents()
    dateComponents.year = 2007
    dateComponents.month = 6
    dateComponents.day = 29
    let date = NSCalendar.currentCalendar().dateFromComponents(dateComponents)!
    
    let orders = [Order(id: "abc123", date: date, email: "amy.apple@clean-swift.com", firstName: "Amy", lastName: "Apple", total: NSDecimalNumber(string: "1.23"))]
    let response = ListOrders.FetchOrders.Response(orders: orders)
    
    // When
    sut.presentFetchedOrders(response)
    
    // Then
    let displayedOrders = listOrdersPresenterOutputSpy.viewModel.displayedOrders
    for displayedOrder in displayedOrders{
      XCTAssertEqual(displayedOrder.id, "abc123", "Presenting fetched orders should properly format order ID")
      XCTAssertEqual(displayedOrder.date, "6/29/07", "Presenting fetched orders should properly format order date")
      XCTAssertEqual(displayedOrder.email, "amy.apple@clean-swift.com", "Presenting fetched orders should properly format email")
      XCTAssertEqual(displayedOrder.name, "Amy Apple", "Presenting fetched orders should properly format name")
      XCTAssertEqual(displayedOrder.total, "$1.23", "Presenting fetched orders should properly format total")
    }
  }
  
  func testPresentFetchedOrdersShouldAskViewControllerToDisplayFetchedOrders()
  {
    // Given
    let listOrdersPresenterOutputSpy = ListOrdersPresenterOutputSpy()
    sut.output = listOrdersPresenterOutputSpy
    
    let orders = [Order(id: "abc123", date: NSDate(), email: "amy.apple@clean-swift.com", firstName: "Amy", lastName: "Apple", total: NSDecimalNumber(string: "1.23"))]
    let response = ListOrders.FetchOrders.Response(orders: orders)
    
    // When
    sut.presentFetchedOrders(response)
    
    // Then
    XCTAssert(listOrdersPresenterOutputSpy.displayFetchedOrdersCalled, "Presenting fetched orders should ask view controller to display them")
  }
}