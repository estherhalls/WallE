//
//  RoverImagesDataProvider.swift
//  WallE
//
//  Created by Esther on 1/22/23.
//

import Foundation

protocol RoverImagesServicable {
    func fetch(from endpoint: Endpoint, completion: @escaping (Result<MarsRovers, NetworkError>) -> Void)
}

struct RoverImagesService: RoverImagesServicable {
    private let service = NasaAPIService()
    
    
//    func fetch(from endpoint: Endpoint, completion: @escaping (Result<MarsRovers, NetworkError>) -> Void) {
//        guard let url = endpoint.fullURL else {
//            completion(.failure(.badURL(endpoint.fullURL)))
//            return
//        }
//        let request = URLRequest(url: url)
//
//        service.perform(request) { result in
//            switch result {
//            case .success(let data):
//                completion(.success(data))
//            case .failure(let error):
//                completion(.failure(.requestError(error)))
//            }
//        }
//    }
}
