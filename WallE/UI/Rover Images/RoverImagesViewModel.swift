//
//  RoverImagesViewModel.swift
//  WallE
//
//  Created by Esther on 1/22/23.
//

import Foundation

protocol RoverImagesViewModelDelegate: AnyObject {
    func updateViews()

}
class RoverImagesViewModel {
    
    // MARK: - Properties
    var topLevel: TLD?
    var roversArray: [MarsRovers] = []
    
    private let service: RoverImagesServicable
    
    weak var delegate: RoverImagesViewModelDelegate?
    
    init(delegate: RoverImagesViewModelDelegate, service: RoverImagesServicable = RoverImagesService()) {
        self.delegate = delegate
        self.service = service
    }
    
    // fetches an array of images from specific date/rover endpoint

    func loadData(endpoint: Endpoint) {
        service.fetchData(from: endpoint) { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.topLevel = data
                    self?.roversArray = []
                    self?.roversArray.append(contentsOf: data.photos)
                    self?.delegate?.updateViews()
                }
            case .failure:
                print("There was an error retrieving data")
            }
        }
    }

    
} // End of Class
