//
//  RocketLaunch.swift
//  SpaceRocket
//
//  Created by Ravil Khayretdinov on 02.05.2022.
//

import Foundation

struct RocketsLaunches: Codable {
    
    let name: String
    let success: Bool?
    let dateUtc: Date
    
    enum CodingKeys: String, CodingKey {
        
        case name
        case success
        case dateUtc = "date_utc"
    }
}

// https://api.spacexdata.com/v4/launches
