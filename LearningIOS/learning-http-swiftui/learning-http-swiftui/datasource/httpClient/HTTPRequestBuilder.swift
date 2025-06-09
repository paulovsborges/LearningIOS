//
//  HTTPRequestBuilder.swift
//  learning-http-swiftui
//
//  Created by Premiersoft on 06/06/25.
//

import Foundation

class HTTPRequestBuilder{
    
    private let endpoint: String
    private let method: HTTPMethodEnum
    
    public init(endpoint: String, method: HTTPMethodEnum) {
        self.endpoint = endpoint
        self.method = method
    }
    
    func build() throws -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "jsonplaceholder.typicode.com"
        urlComponents.path = endpoint
        
        guard let url = urlComponents.url else {
            throw NSError(domain: "Invalid URL components", code: 0, userInfo: nil)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
    }
}
