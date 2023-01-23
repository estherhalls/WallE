//
//  ServiceRequestingImageView.swift
//  WallE
//
//  Created by Esther on 1/22/23.
//

import UIKit

class ServiceRequestingImageView: UIImageView {
    
    let service = APIService()
    
    @MainActor func fetchImage(using url: URL) {
        Task {
            do {
                let response = try await
                service.perform(URLRequest(url: url))
                let image = UIImage(data: response.data)
                self.contentMode = .scaleAspectFill
                self.image = image
            } catch {
                self.setDefaultImage()
            }
        }
    }
    
    func setDefaultImage() {
        DispatchQueue.main.async {
            self.contentMode = .scaleAspectFit
            self.image = UIImage(systemName: "mountain.2")
        }
    }
}
