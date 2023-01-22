//
//  NasaAPIService.swift
//  WallE
//
//  Created by Esther on 1/22/23.
//

import Foundation

struct NasaAPIService {
    
    // Data Task
    func perform(_ request: URLRequest, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: request) { dTaskData, response, error in
            if let error {
                completion(.failure(.requestError(error)))
            }
            if let response = response as? HTTPURLResponse {
                print("\(response.statusCode)")
            }
            // Check for Data
            guard let data = dTaskData else {
                completion(.failure(.couldNotUnwrap))
                return
            }
            do {
                guard let marsRovers = try? JSONDecoder().decode(MarsRovers.self, from: data) else {
                    completion(.failure(.couldNotUnwrap))
                    return
                }
                completion(.success(marsRovers))
            }
            completion(.failure(.errorDecoding))
            
        }.resume()
    }
} // End of Struct
