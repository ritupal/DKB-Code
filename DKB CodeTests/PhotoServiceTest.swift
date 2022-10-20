//
//  PhotoServiceTest.swift
//  DKB CodeTests
//
//  Created by Kumari Ritu Pal on 20/10/22.
//

import XCTest
@testable import DKB_Code

class PhotoServiceTest: XCTestCase, Mockable, PhotoServiceable {
    func getPhotoList(endPoint: PhotosEndPoint, completion: @escaping (Result<[Photo?], RequestError>) -> Void) {
        let object = loadJson(fileName: .photoList, type: [Photo].self)
        completion(.success(object))
    }
    
    func getPhotoDetail(id: Int, completion: @escaping (Result<Photo, RequestError>) -> Void) {
        let object = loadJson(fileName: .photoDetail, type: Photo.self)
        completion(.success(object))
    }
    
    func test_photo_service_mock_success() {
        let serviceMock = PhotoServiceTest()
        serviceMock.getPhotoList(endPoint: .photoList) { result in
            switch result {
            case .success(let photos):
                XCTAssertEqual(photos.count, 1)
            case .failure(let error):
                XCTAssertNil(error)
            }
        }
    }

}
