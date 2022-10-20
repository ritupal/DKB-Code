//
//  PhotoServiceTestable.swift
//  DKB CodeTests
//
//  Created by Kumari Ritu Pal on 20/10/22.
//

import XCTest
@testable import DKB_Code

class PhotoServiceTestDouble: PhotoServiceable {
    
    let networkService: NetworkServiceTestDoubles

    init(service: NetworkServiceTestDoubles) {
        self.networkService = service
    }
    
    func getPhotoList(endPoint: PhotosEndPoint, completion: @escaping (Result<[Photo?], RequestError>) -> Void) {
        networkService.execute(endPoint: endPoint, for: [Photo?].self, handler: completion)
    }
    
    func getPhotoDetail(id: Int, completion: @escaping (Result<Photo, RequestError>) -> Void) {
        let detailEndPoint = PhotosEndPoint.photoDetail(id: id)
        networkService.execute(endPoint: detailEndPoint, for: Photo.self, handler: completion)
    }
    

}
