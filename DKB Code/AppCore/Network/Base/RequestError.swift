//
//  RequestError.swift
//  DKB Code
//
//  Created by Kumari Ritu Pal on 19/10/22.
//

import Foundation

enum RequestError: Error {
    case invalidURL
    case unauthorized
    case noResponse
    case decodeFail
    case unexpectedStatusCode
    case unknown
    case noInternet
    case sessionError(error: Error)
    
    var customMessage: String {
        switch self {
        case .invalidURL:
            return "URL is invalid."
        case .decodeFail:
            return "unable to decode the json"
        case .unauthorized:
            return "Session expired"
        case .noInternet:
            return "no internet connection"
        case .sessionError(let error):
            return error.localizedDescription
        default :
            return ""
        }
    }
}
