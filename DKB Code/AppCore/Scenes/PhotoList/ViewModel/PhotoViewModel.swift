//
//  HomeViewModel.swift
//  DKB Code
//
//  Created by Kumari Ritu Pal on 19/10/22.
//

import Foundation

class PhotoViewModel {
    let photoService: PhotoServiceable
    private(set) var photos: [Photo]? {
        didSet {
            self.onPhotoUpdate()
        }
    }
    var onPhotoUpdate: ()-> Void = {}
    
    init(service: PhotoServiceable) {
        self.photoService = service
    }
    
    func fetchPhotos() {
        photoService.getPhotoList(endPoint: .photoList) { result in
            switch result {
            case .success(let response):
                self.photos = response.compactMap{$0}
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
