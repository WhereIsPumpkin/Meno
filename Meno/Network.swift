//
//  Network.swift
//  Meno
//
//  Created by Saba Gogrichiani on 18.05.25.
//

import VoidNet
import Foundation

final class Network {
    static let shared = Network()
    
    private let voidNet = VoidNet.shared
    
    private init() {}
    
    func sendAPIRequest<T: Decodable>(
        scheme: Scheme = .https,
        host: String,
        port: Int? = nil,
        path: String,
        query: Query = .emptyQuery,
        method: HTTPMethod = .get,
        headers: [String: String] = [:],
        body: Data? = nil,
        as type: T.Type
    ) async throws -> T {
        let endpoint = EndPoint(
            scheme: scheme,
            host: host,
            port: port,
            path: path,
            query: query,
            method: method,
            headers: headers,
            body: body
        )
        
        return try await voidNet.request( endpoint: endpoint, type: type )
    }
}

