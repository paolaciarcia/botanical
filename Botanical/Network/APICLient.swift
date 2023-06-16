//
//  APICLient.swift
//  Botanical
//
//  Created by Erick Lozano Borges on 16/06/23.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

enum APICLientError: Error {
    case invalidHttpResponse
    case httpError(Int)
}

class APICLient {
        
    let session: URLSession = .shared
    
    func makeRequest<T: Decodable>(_ httpMethod: HTTPMethod, url: URL, query: [String: String] = [:]) async throws -> T {
        // [String: String] -> [URLQueryItem]
        let queryItems = query.map { URLQueryItem(name: $0, value: $1) }
        
        // add query params to URL
        let urlWithParams = url.appending(queryItems: queryItems)
        
        // Create URLRequest from URL, and add http method
        var request = URLRequest(url: urlWithParams)
        request.httpMethod = httpMethod.rawValue
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APICLientError.invalidHttpResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw APICLientError.httpError(httpResponse.statusCode)
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: data)
    }
    
}
