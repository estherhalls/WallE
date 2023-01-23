//
//  NasaAPIService.swift
//  WallE
//
//  Created by Esther on 1/22/23.
//

import Foundation

struct NasaAPIService {
    
    // MARK: - URL
    static let baseURLString = "https://api.nasa.gov/mars-photos/api/v1/rovers/"
    static let kPhotosComponent = "photos"
    static let kAPIKeyKey = "api_key"
    static let kAPIKeyValue = "xdfuqENDMd6cbF4XAx0Gc86gHcUHKPQsMPjPJQr6"
    static let kEarthDateKey = "earth_date"
    
    // Data Task
    static func fetchRoverData(with roverComponent: String, dateValue: String, completion: @escaping (Result<MarsRovers, NetworkError>) -> Void) {
        // Get URL
        guard let baseURL = URL(string: baseURLString) else {
            completion(.failure(.badURL))
            return
        }
        // Compose Final URL
        let roverURL = baseURL.appending(path: roverComponent)
        let photosURL = roverURL.appending(path: kPhotosComponent)
        /// Add Query items with URLComponent Struct
        var urlComponents = URLComponents(url: photosURL, resolvingAgainstBaseURL: true)
        /// Query Items
        let dateQuery = URLQueryItem(name: kEarthDateKey, value: dateValue)
        let apiKeyQuery = URLQueryItem(name: kAPIKeyKey, value: kAPIKeyValue)
        urlComponents?.queryItems = [dateQuery, apiKeyQuery]
        
        guard let finalURL = urlComponents?.url else {
            completion(.failure(.badURL))
            return
        }
        print(finalURL)
        
        // Start Data Task
        URLSession.shared.dataTask(with: finalURL) { dTaskData, response, error in
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
                guard let marsRovers = try? JSONDecoder().decode(MarsRovers.self, from: data)
                else {
                    completion(.failure(.couldNotUnwrap))
                    return
                }
                completion(.success(marsRovers))
            }
            completion(.failure(.errorDecoding))
            
        }.resume()
    }
} // End of Struct
