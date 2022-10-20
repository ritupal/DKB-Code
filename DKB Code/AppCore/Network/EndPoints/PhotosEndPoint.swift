//
//  PhotosEndPoint.swift
//  DKB Code
//
//  Created by Kumari Ritu Pal on 19/10/22.
//

import Foundation

enum PhotosEndPoint {
    case photoList
    case photoDetail(id: Int)
}

extension PhotosEndPoint: Endpoint {
    
    var host: String {
        switch self {
        case .photoList, .photoDetail:
            return "jsonplaceholder.typicode.com"
        }
    }
    
    var path: String {
        switch self {
        case .photoList:
            return "/photos"
        case .photoDetail(let id):
            return "/photos/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .photoList, .photoDetail:
            return .get
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .photoList, .photoDetail:
            return ["Content-Type": "application/json;charset=utf-8"]
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .photoList, .photoDetail:
            return nil
        }
    }
}


