//
//  Mockable.swift
//  DKB CodeTests
//
//  Created by Kumari Ritu Pal on 20/10/22.
//

import Foundation
@testable import DKB_Code

enum MockFiles: String {
    case photoList = "PhotoListResponse"
    case photoDetail = "PhotoDetailResponse"
}

protocol Mockable: AnyObject {
    var bundle: Bundle {get}
    func loadJson<T: Decodable>(fileName: MockFiles, type: T.Type) -> T
    func loadData(endPoint: Endpoint, completionHandler: @escaping(Result<Data, RequestError>) -> Void)
}

extension Mockable {
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    func loadJson<T: Decodable>(fileName: MockFiles, type: T.Type) -> T {
        guard let path = bundle.url(forResource: fileName.rawValue, withExtension: "json") else {
            fatalError("Failed to load Json")
        }
        
        do {
            let data = try Data(contentsOf: path)
            let decodeObject = try JSONDecoder().decode(T.self, from: data)
            return decodeObject
        } catch {
            fatalError("Failed to load Json")
        }
    }
    
    func loadData(endPoint: Endpoint, completionHandler: @escaping(Result<Data, RequestError>) -> Void) {
        let fileName: MockFiles = endPoint.path == "/photos/" ? .photoDetail : .photoList
        guard let path = bundle.url(forResource: fileName.rawValue, withExtension: "json") else {
            fatalError("Failed to load Json")
        }
        do {
            let data = try Data(contentsOf: path)
            completionHandler(.success(data))
        } catch {
            completionHandler(.failure(.decodeFail))
        }
        
    }

}
