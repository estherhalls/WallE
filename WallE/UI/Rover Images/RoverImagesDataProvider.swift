//
//  RoverImagesDataProvider.swift
//  WallE
//
//  Created by Esther on 1/22/23.
//

import Foundation

protocol RoverImagesServicable {
    func fetchRoverData(from endpoint: Endpoint) async throws -> MarsRovers
}

struct RoverImagesService: RoverImagesServicable {
    private let service = APIService()
    func fetchRoverData(from endpoint: Endpoint) async throws -> MarsRovers {
        guard let url = endpoint.fullURL else {
            throw NetworkError.badURL
        }
        let response = try await
        service.perform(URLRequest(url: url))
        return try JSONDecoder().decode(MarsRovers.self, from: response.data)
    }
}
