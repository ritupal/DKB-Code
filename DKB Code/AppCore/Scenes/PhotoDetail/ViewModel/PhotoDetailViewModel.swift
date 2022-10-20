//
//  PhotoDetailViewModel.swift
//  DKB Code
//
//  Created by Kumari Ritu Pal on 20/10/22.
//

import Foundation

class PhotoDetailViewModel {
    let photoService: PhotoServiceable
    let photoId: Int?
    
    private(set) var photo: Photo? {
        didSet {
            self.onPhotoDetailFetched(photo)
        }
    }
    var onPhotoDetailFetched: (_ obj: Photo?)-> Void = {_ in }
    
    init(service: PhotoServiceable, photoId: Int?) {
        self.photoService = service
        self.photoId = photoId
    }
    
    func getPhotoDetail() {
        guard let id = photoId else { return }
        photoService.getPhotoDetail(id: id) { result in
            switch result {
            case .success(let response):
                self.photo = response
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
