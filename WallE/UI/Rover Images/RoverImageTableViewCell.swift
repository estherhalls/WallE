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
    
    // MARK: - Methods
    private func fetchImage(with roverImage: String) {
        guard let imageURL = URL(string: roverImage) else { return }
        requestingImageView.fetchImage(using: imageURL)
    }
    
    func configureCell(with data: MarsRovers) {
        DispatchQueue.main.async {
            self.roverNameLabel.text = data.rover.name
            self.cameraNameLabel.text = data.camera.fullName
            self.fetchImage(with: data.imageURL)
        }
    }
}
