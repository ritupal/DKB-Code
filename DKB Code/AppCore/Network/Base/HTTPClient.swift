//
//  HTTPClient.swift
//  DKB Code
//
//  Created by Kumari Ritu Pal on 19/10/22.
//

import Foundation

protocol HTTPClient {
    var session: URLSession {get set}
    func request(endPoint: Endpoint, completionHandler: @escaping(Result<Data, RequestError>) -> Void)
}

struct NetworkClient: HTTPClient {
    var session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func request(endPoint: Endpoint, completionHandler: @escaping(Result<Data, RequestError>) -> Void) {
        guard let request = endPoint.makeURLRequest() else {
            completionHandler(.failure(.invalidURL))
            return
        }
        
        self.session.dataTask(with: request) { data, response, error in
            guard let data = data else {
                completionHandler(.failure(.noResponse))
                return
            }
            completionHandler(.success(data))
        }.resume()
        
    }
}
