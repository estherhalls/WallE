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
    // All must take in string for date value
    case curiosity(String)
    case opportunity(String)
    case spirit(String)
    
    // String returned for the rover name endpoints
    var roverComponent: String {
        switch self {
        case .curiosity:
            return "curiosity"
        case .opportunity:
            return "opportunity"
        case .spirit:
            return "spirit"
        }
    }
    
    // Declare Computed Property
    var fullURL: URL? {
        /// Unwrap baseURL as variable so that you can mutate it
        guard var baseURL = URL.baseURL else {
            return nil
        }
        /// Switch on self, self being the case of the enum, and append the correct path component to the url
        switch self {
        case .curiosity(let dateValue), .opportunity(let dateValue), .spirit(let dateValue):
            baseURL.appendPathComponent(roverComponent)
            
            let photosURL = baseURL.appending(path: "photos")
            
            /// Unwrap urlComponents so you can add the api key
            guard var urlComponents = URLComponents(url: photosURL, resolvingAgainstBaseURL: true) else {
                return nil
            }
            /// Add Query Items
            let dateQuery = URLQueryItem(name: "earth_date", value: dateValue)
            // CHANGE DEMO_KEY TO xdfuqENDMd6cbF4XAx0Gc86gHcUHKPQsMPjPJQr6
            let apiQuery = URLQueryItem(name: "api_key", value: "xdfuqENDMd6cbF4XAx0Gc86gHcUHKPQsMPjPJQr6")
            let pageQuery = URLQueryItem(name: "page", value: "1")
            urlComponents.queryItems = [dateQuery, apiQuery, pageQuery]
            return urlComponents.url
        }
    }
}
