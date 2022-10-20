//
//  NetworkServiceTestDoubles.swift
//  DKB CodeTests
//
//  Created by Kumari Ritu Pal on 20/10/22.
//

import Foundation

@testable import DKB_Code

class NetworkServiceTestDoubles: NetworkServiceProtocol {
    let networkClient: HTTPClient
    
    internal init(networkClient: HTTPClient) {
        self.networkClient = networkClient
    }
    
    func execute<T>(endPoint: Endpoint, for model: T.Type, handler: @escaping (Result<T, RequestError>) -> Void) where T : Decodable {
        networkClient.request(endPoint: endPoint) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let responseModel = try decoder.decode(model.self, from: data)
                    handler(.success(responseModel))
                } catch (let error) {
                    handler(.failure(.sessionError(error: error)))
                }
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
