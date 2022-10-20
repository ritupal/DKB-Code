//
//  PhotoListCellViewModel.swift
//  DKB Code
//
//  Created by Kumari Ritu Pal on 19/10/22.
//

import Foundation

internal final class PhotoListCellViewModel {
    var title: String?
    var imageUrl: String?
    
    init(model: Photo?) {
        guard let responseModel = model else { return }
        self.title = responseModel.title
        self.imageUrl = responseModel.thumbnailUrl
    }
}
