//
//  HTTPClient.swift
//  learning-http-swiftui
//
//  Created by Premiersoft on 06/06/25.
//

import Foundation

class HTTPClient{
    
    private let session: URLSession
    /*
     Had to set the session like this because of the following issue:
     https://developer.apple.com/forums/thread/777999
     */
    init(session: URLSession = URLSession(configuration: .ephemeral)) {
        self.session = session
    }
    
    func execute<T: Codable>(request : URLRequest, returnType: T.Type) async throws -> T {
        
        return try await withCheckedThrowingContinuation{ continuation in
            self.session.dataTask(with: request){ data, response, error in
                do {
                    if let data = data {
                        let response = try JSONDecoder().decode(T.self, from: data)
                        continuation.resume(returning: response)
                    } else {
                        continuation.resume(throwing: NSError(domain: "", code: 0))
                    }
                } catch let error {
                    continuation.resume(throwing: error)
                }
            }.resume()
        }
    }
}
