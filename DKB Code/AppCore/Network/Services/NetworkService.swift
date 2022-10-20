//
//  NetworkService.swift
//  DKB Code
//
//  Created by Kumari Ritu Pal on 19/10/22.
//

import Foundation

protocol NetworkServiceProtocol {
    
    func execute<T: Decodable>(endPoint: Endpoint, for model: T.Type, handler: @escaping(Result<T, RequestError>)-> Void)
}

class NetworkService: NetworkServiceProtocol {
    let networkClient: HTTPClient
    
    init(networkClient: HTTPClient) {
        self.networkClient = networkClient
    }
    
    func execute<T: Decodable>(endPoint: Endpoint, for model: T.Type, handler: @escaping(Result<T, RequestError>)-> Void) {
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
