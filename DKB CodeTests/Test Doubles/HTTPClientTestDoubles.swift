//
//  HTTPClientTestDoubles.swift
//  DKB CodeTests
//
//  Created by Kumari Ritu Pal on 20/10/22.
//

import Foundation
@testable import DKB_Code

class HTTPClientTestDoubles: HTTPClient, Mockable {
    var session: URLSession
    
    internal init(session: URLSession) {
        self.session = session
    }
    
    func request(endPoint: Endpoint, completionHandler: @escaping (Result<Data, RequestError>) -> Void) {
        loadData(endPoint: endPoint) { result in
            completionHandler(result)
        }
    }

}
