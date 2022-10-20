//
//  PhotoListViewModelTest.swift
//  DKB CodeTests
//
//  Created by Kumari Ritu Pal on 20/10/22.
//

import XCTest
@testable import DKB_Code

class PhotoListViewModelTest: XCTestCase {

    //function to create subject under test(SUT)
    func makeSUT() -> PhotoListViewModel {
        let client = HTTPClientTestDoubles(session: .shared)
        let networkService = NetworkServiceTestDoubles(networkClient: client)
        let service = PhotoServiceTestDouble(service: networkService)
        let sut = PhotoListViewModel.init(service: service)
        return sut
    }

    func test_fetch_photo_list_sucessfully() {
        let expectation = XCTestExpectation(description: "fetched photos")
        //given
        
        let sut = makeSUT()
        
        //then
        sut.fetchPhotos()
        XCTAssertEqual(sut.photos?.count, 1)
        expectation.fulfill()
    }
    
}
