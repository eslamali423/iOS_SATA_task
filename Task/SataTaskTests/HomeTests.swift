//
//  HomeTests.swift
//  SataTaskTests
//
//  Created by Eslam Ali  on 11/06/2022.
//

import XCTest

@testable import Task


class HomeTests: XCTestCase {

    var sut : BaseAPI<BaseDataNetwroking>!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = BaseAPI()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    func testFetchData(){
        
        let promise =  XCTestExpectation(description: "Fetch Data Completed")
        var responseError : Error?
        var responseResult : APIResponse?
        
        guard let bundle =  Bundle.unitTest.path(forResource: "stub", ofType: "json") else {
            XCTFail("Error : Content not found")
            return
        }
  
        let url = URL(fileURLWithPath: bundle)
        
        var network = BaseDataNetwroking.getData
        network.baseUrl = url.absoluteString
        
        
        sut.fetchData(target: network, responseClass: APIResponse.self) { [weak self ](result) in
      
            
            switch result {
            case.success(let response):
                responseResult = response
            case .failure(let error) :
                responseError = error
            }
            
            promise.fulfill()
            self?.wait(for: [promise], timeout: 1)
            XCTAssertNil(responseError)
            XCTAssertNotNil(responseResult)
            

        }
    }
}
