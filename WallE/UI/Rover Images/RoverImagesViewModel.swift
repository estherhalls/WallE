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
//    var topLevel: TLD?
    var roversArray: [MarsRovers] = []
//    var roverData: MarsRovers?
    
    private let service: RoverImagesServicable
    
    weak var delegate: RoverImagesViewModelDelegate?
    
    init(delegate: RoverImagesViewModelDelegate, service: RoverImagesServicable = RoverImagesService()) {
        self.delegate = delegate
        self.service = service
    }
    
    // fetches an array of images from specific date/rover endpoint
    func loadData(from endpoint: Endpoint) {
        service.fetchData(from: endpoint) { [weak self] result in
            switch result {
            case .success(let data):

                self?.roversArray = data
                DispatchQueue.main.async {
                    self?.delegate?.updateViews()
                }
            case .failure(let error):
                print(error.errorDescription!)
                
            }
        }
    }
    
} // End of Class
