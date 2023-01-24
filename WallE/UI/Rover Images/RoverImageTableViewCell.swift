//
//  RoverImageTableViewCell.swift
//  WallE
//
//  Created by Esther on 1/22/23.
//

import UIKit

class RoverImageTableViewCell: UITableViewCell {
    
// MARK: - Outlets
    @IBOutlet weak var roverNameLabel: UILabel!
    @IBOutlet weak var cameraNameLabel: UILabel!
    @IBOutlet weak var requestingImageView: ServiceRequestingImageView!
    
//    // MARK: - Properties
//    var data: MarsRovers?
//    var camera: CameraDict?
//    var rover: RoverDict?
    
    // MARK: - Methods
    
    private func fetchImage(with roverImage: String) {
        guard let imageURL = URL(string: roverImage) else {
            return
        }
        requestingImageView.fetchImage(using: imageURL)
    }
    
    func configureCell(with data: MarsRovers) {
        roverNameLabel.text = data.rover.name
        cameraNameLabel.text = data.camera.fullName
        fetchImage(with: data.imageURL)
    }
}

//extension RoverImageTableViewCell: RoverImagesViewModelDelegate {
//
//}
