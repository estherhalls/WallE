//
//  MarsRovers.swift
//  WallE
//
//  Created by Esther on 1/22/23.
//

import Foundation
struct MarsRovers: Decodable {
    // Date is "yyyy-mm-dd"
    let earthDate: String
    let camera: [CameraDict]
    let rover: [RoverDict]
    let imageURL: String
    
    
} // End of Struct

struct CameraDict: Decodable {
    private enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
    }
    let name: String
    let fullName: String
}

struct RoverDict: Decodable {
    let name: String
}

// Example of data:
/*
 {
    "photos": [
        {
            "id": 102685,
            "sol": 1004,
            "camera": {
                "id": 20,
                "name": "FHAZ",
                "rover_id": 5,
                "full_name": "Front Hazard Avoidance Camera"
            },
            "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01004/opgs/edr/fcam/FLB_486615455EDR_F0481570FHAZ00323M_.JPG",
            "earth_date": "2015-06-03",
            "rover": {
                "id": 5,
                "name": "Curiosity",
                "landing_date": "2012-08-06",
                "launch_date": "2011-11-26",
                "status": "active"
            }
        }
 */
