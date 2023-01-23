//
//  DataExtension.swift
//  WallE
//
//  Created by Esther on 1/23/23.
//

import Foundation
extension Data {
    func decode<T: Decodable>(type: T.Type, decoder: JSONDecoder = JSONDecoder()) throws -> T {
        do {
            return try decoder.decode(type.self, from: self)
        } catch {
            throw error
        }
    }
}
