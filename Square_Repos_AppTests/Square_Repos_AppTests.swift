//
//  SquareReposAppTests.swift
//  SquareReposAppTests
//
//  Created by mostafa elsanadidy on 18.06.23.
//

import XCTest
@testable import Square_Repos_App

class SquareReposAppTests: XCTestCase {

    let timeOut : TimeInterval = 600
    var expectation : XCTestExpectation!
    
    var respositories : Repo_M!
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        expectation = XCTestExpectation.init(description: "Server Respond in time")
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        respositories = nil
    }

    func testGetDeliveryBillsItems() throws{
        
        APIClient.getRepositories{
            result in
            
            switch result{
                            case .failure(let error) :
                                defer { self.expectation.fulfill() }
                print(error)
                                XCTAssertNil(error)
                            case .success(let value) :
                defer { self.expectation.fulfill() }
                print(value![0].name ?? "")
                XCTAssertNotEqual(value![0].name, nil)
                            }
        }
        wait(for: [expectation], timeout: timeOut)
    }
    
    
    func testPerformanceExample() throws {
           // This is an example of a performance test case.
           self.measure {
               // Put the code you want to measure the time of here.
               
           }
       }

}
