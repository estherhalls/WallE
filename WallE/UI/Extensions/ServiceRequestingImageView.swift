//
//  ServiceRequestingImageView.swift
//  WallE
//
//  Created by Esther on 1/22/23.
//

import UIKit

class ServiceRequestingImageView: UIImageView {
    
    let service = APIService()
    
//    @MainActor func fetchImage(using objectURL: String) {
//        Task {
//            guard let url = URL(string: objectURL) else {
//                return }
//            do {
//                let response = try await
//                service.perform(URLRequest, completion: { <#Result<TLD, NetworkError>#> in
//                    <#code#>
//                })
//                let image = UIImage(data: response.data)
//                self?.contentMode = .scaleAspectFill
//                self.image = image
//            } catch {
//                self.setDefaultImage()
//            }
//        }
//    }
    
    func fetchImage(using url: URL) {
      
        let request = URLRequest(url: url)
       
        service.perform(request) { [weak self]
            result in
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data) else {
                    self?.setDefaultImage()
                    return
                }
                DispatchQueue.main.async {
                    self?.contentMode = .scaleAspectFill
                    self?.image = image
                }
            case .failure:
                self?.setDefaultImage()
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
