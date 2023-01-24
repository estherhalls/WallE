//
//  RoverImagesDataProvider.swift
//  WallE
//
//  Created by Esther on 1/22/23.
//

import Foundation

protocol RoverImagesServicable {

    func fetchData(from endpoint: Endpoint, completion: @escaping (Result<[MarsRovers],NetworkError>) -> Void)
}

struct RoverImagesService: RoverImagesServicable {

    // MARK: - Properties
    private let service = APIService()

    // MARK: - Methods
    func fetchData(from endpoint: Endpoint, completion: @escaping (Result<[MarsRovers],NetworkError>) -> Void) {
        guard let url = endpoint.fullURL else {
            completion(.failure(.badURL))
            return
        }
        let request = URLRequest(url: url)
        service.perform(request) { result in
            switch result {
            case .success(let data):
                do {
                    let data = try
                    data.decode(type: [MarsRovers].self)
                    completion(.success(data))
                } catch {
                    completion(.failure(.errorDecoding))
                }
            case .failure(let error):
                print(error.errorDescription!)
            }
        }
    }
}


