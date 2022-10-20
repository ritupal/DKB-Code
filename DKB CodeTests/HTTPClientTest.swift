//
//  HTTPClientTest.swift
//  DKB CodeTests
//
//  Created by Kumari Ritu Pal on 20/10/22.
//

import Foundation

import XCTest
@testable import DKB_Code

class HTTPClientTest: XCTestCase {
    
    //function to create subject under test(SUT)
    func makeSUT() -> HTTPClient {
        let sut = HTTPClientTestDoubles(session: .shared)
        return sut
    }
    
    func test_confirmsto_httpclient() {
        //given
        let sut = makeSUT()
        
        //then
        XCTAssert(sut is HTTPClientTestDoubles, "SUT should confirms to HTTP Client")
        XCTAssertNotNil(sut, "SUT should not be nil")
    }
}
