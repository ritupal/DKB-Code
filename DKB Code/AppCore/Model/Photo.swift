//
//  Photo.swift
//  DKB Code
//
//  Created by Kumari Ritu Pal on 19/10/22.
//

import Foundation

struct Photo: Decodable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String?
    let thumbnailUrl: String?
}
