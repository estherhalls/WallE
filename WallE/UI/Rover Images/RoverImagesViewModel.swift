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
    // Source of Truth
    //    static let shared = RoverImagesViewModel()
    var topLevel: TLD?
    var roversArray: [MarsRovers] {
        topLevel?.photos ?? []
    }
    
    //    private let service: RoverImagesServicable
    private let service: RoverImagesServicable
    private let taskGroup = DispatchGroup()
    
    weak var delegate: RoverImagesViewModelDelegate?
    
    //    var rovers: MarsRovers?
    
    init(delegate: RoverImagesViewModelDelegate, service: RoverImagesServicable = RoverImagesService()) {
        self.delegate = delegate
        self.service = service
    }
    
    //    @MainActor func fetchData(for endpoint: Endpoint) {
    //        Task {
    //            do {
    //                self.topLevel = try await
    //                service.fetchRoverData(from: endpoint)
    //            } catch {
    ////                self.error = error
    //                print ("error")
    //            }
    //        }
    //    }
    //    @MainActor func loadData(){
    //        Task {
    //            do {
    //                async let
    //            }
    //        }
    //    }
    
    func loadData(from endpoint: Endpoint) {
        service.fetchData(from: endpoint) { result in
            switch result {
            case .success(let tld):
                self.topLevel = tld
                DispatchQueue.main.async {
                    self.delegate?.updateViews()
                }
            case .failure(let error):
                print(error.errorDescription!)
                
            }
        }
    }
    
    //    func fetchData(from endpoint: Endpoint) {
    //        guard let url = endpoint.fullURL else {
    //            return
    //        }
    //        let request = URLRequest(url: url)
    //        service.perform(request) { result in
    //            switch result {
    //            case .failure(let error):
    //                print(error.errorDescription!)
    //            case .success(let tld):
    //                self.topLevel = tld
    //                DispatchQueue.main.async {
    //                    self.delegate?.updateViews()
    //                }
    //            }
    //        }
    //    }
    
    
} // End of Class
