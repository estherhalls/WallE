//
//  RoverImagesViewModel.swift
//  WallE
//
//  Created by Esther on 1/22/23.
//

import Foundation

class RoverImagesViewModel {
    
    // MARK: - Properties
    // Source of Truth
    private let service: RoverImagesServicable

    var rovers: MarsRovers?
    
    init(service: RoverImagesServicable = RoverImagesService()) {
        self.service = service
    }
    
    @MainActor func fetchData(for endpoint: Endpoint) {
        Task {
            do {
                self.rovers = try await
                service.fetchRoverData(from: endpoint)
            } catch {
//                self.error = error
                print ("error")
            }
        }
    }
    
    
} // End of Class
