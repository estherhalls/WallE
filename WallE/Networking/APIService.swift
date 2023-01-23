//
//  APIService.swift
//  WallE
//
//  Created by Esther on 1/22/23.
//

import Foundation

struct APIService {
    func perform(_ request:URLRequest) async throws -> (data: Data, response: URLResponse) {
        try await URLSession.shared.data(for: request)
    }
}
