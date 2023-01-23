//
//  Endpoint.swift
//  WallE
//
//  Created by Esther on 1/22/23.
//

import Foundation

extension URL {
    /// enum cannot contain stored properties, so adding base URL must be static
    static let baseURL = URL(string:"https://api.nasa.gov/mars-photos/api/v1/rovers/")
}

enum Endpoint {
   
    case curiosity(String)
    case opportunity(String)
    case spirit(String)
    
    // Declare Computed Property
    var fullURL: URL? {
        /// Unwrap baseURL as variable so that you can mutate it
        guard var baseURL = URL.baseURL else {
            return nil
        }
        /// Switch on self, self being the czase of the enum, and append the correct path component to the url
        switch self {
        case .curiosity(let curiosity):
            baseURL.appendPathComponent(curiosity)
            return baseURL
        case .opportunity(let opportunity):
            baseURL.appendPathComponent(opportunity)
            return baseURL
        case .spirit(let spirit):
            baseURL.appendPathComponent(spirit)
            return baseURL
        }
        
        let photosURL = baseURL.appending(path: "photos")
        /// Unwrap urlComponents so you can add the api key
        guard var urlComponents = URLComponents(url: photosURL, resolvingAgainstBaseURL: true) else {
            return nil
        }
        let dateQuery = URLQueryItem(name: <#T##String#>, value: <#T##String?#>)
        let apiQuery = URLQueryItem(name: <#T##String#>, value: <#T##String?#>)
        urlComponents.queryItems
    }
}
