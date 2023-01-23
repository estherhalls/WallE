//
//  APIService.swift
//  WallE
//
//  Created by Esther on 1/22/23.
//

import Foundation

//struct APIService {
//    func perform(_ request:URLRequest) async throws -> (data: Data, response: URLResponse) {
//        try await URLSession.shared.data(for: request)
//    }
//}

// Do I need async throws in order to get data for all segmented controls upon viewdidload?
struct APIService {
    func perform(_ request: URLRequest, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: request) { dTaskData, response, error in
            if let error {
                completion(.failure(.requestError(error)))
            }
            if let response = response as? HTTPURLResponse {
                print("\(response.statusCode)")
            }
            // Check For Data
            guard let data = dTaskData else {
                completion(.failure(.couldNotUnwrap))
                return
            }
                completion(.success(data))
            // Resume starts dataTask and continues it. Tasks begin in suspended state.
        }.resume()
    }
}
