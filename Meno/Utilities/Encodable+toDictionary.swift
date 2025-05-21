//
//  Encodable+toDictionary.swift
//  Meno
//
//  Created by Saba Gogrichiani on 19.05.25.
//

import Foundation

extension Encodable {
    func toDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        let jsonObject = try JSONSerialization.jsonObject(with: data)
        
        guard let dict = jsonObject as? [String: Any] else {
            throw NSError(domain: "toDictionary", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to convert to [String: Any]"])
        }

        return dict
    }
}
