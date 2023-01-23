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
    
    // MARK: - Properties
    var data: MarsRovers?
    var camera: CameraDict?
    var rover: RoverDict?
    
    // MARK: - Methods
    func configureCell(with data: MarsRovers) {
        roverNameLabel.text = rover?.name
        cameraNameLabel.text = camera?.fullName
        fetchImage(with: data.imageURL)
    }
    
    private func fetchImage(with roverImage: String) {
        guard let url = URL(string: roverImage) else {
            return
        }
        requestingImageView.fetchImage(using: url)
    }
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
