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
        scheme: Scheme = .http,
        host: String = Constants.apiURL,
        port: Int? = Constants.apiPort,
        path: String,
        query: VoidNet.Query = .emptyQuery,
        headers: VoidNet.Headers = .emptyHeaders,
        body: VoidNet.Body = .emptyBody,
        method: HTTPMethod = .get,
        type: T.Type = EmptyData.self
    ) async throws -> T {
        let endpoint = EndPoint(
            scheme: scheme,
            host: host,
            port: port,
            path: path,
            query: query,
            headers: headers,
            body: body,
            method: method
        )
        
        return try await voidNet.request( endpoint: endpoint, type: type )
    }
}

