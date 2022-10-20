//
//  PhotoService.swift
//  DKB Code
//
//  Created by Kumari Ritu Pal on 19/10/22.
//

import Foundation

protocol PhotoServiceable {
    func getPhotoList(endPoint: PhotosEndPoint, completion: @escaping(Result<[Photo?], RequestError>) -> Void)
    func getPhotoDetail(id: Int, completion: @escaping(Result<Photo, RequestError>) -> Void)
}

struct PhotoService: PhotoServiceable {
    let networkService: NetworkService

    init(service: NetworkService) {
        self.networkService = service
    }
    
    func getPhotoList(endPoint: PhotosEndPoint, completion: @escaping(Result<[Photo?], RequestError>) -> Void) {
        networkService.execute(endPoint: endPoint, for: [Photo?].self, handler: completion)
    }
    
    func getPhotoDetail(id: Int, completion: @escaping(Result<Photo, RequestError>) -> Void) {
        let detailEndPoint = PhotosEndPoint.photoDetail(id: id)
        networkService.execute(endPoint: detailEndPoint, for: Photo.self, handler: completion)
    }
    
}
