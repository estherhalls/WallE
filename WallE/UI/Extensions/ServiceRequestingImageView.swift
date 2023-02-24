//
//  ServiceRequestingImageView.swift
//  WallE
//
//  Created by Esther on 1/22/23.
//

import UIKit

class ServiceRequestingImageView: UIImageView {
    
    let service = APIService()
    
    func passImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        let request = URLRequest(url: url)
        service.perform(request) { result in
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data) else {
                    completion(nil)
                    return
                }
                DispatchQueue.main.async {
                    completion(image)
                }
            case .failure:
                completion(nil)
            }
        }
    }

    
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
