//
//  Rocket.swift
//  SpaceRocket
//
//  Created by Ravil Khayretdinov on 02.05.2022.
//

import Foundation

struct RocketData: Decodable {
    
    let flickrImages: [String]
    let name: String
    let height: Height
    let diameter: Diameter
    let mass: Mass
    let payloadWeights: [PayloadWeights]
    let firstFlight: String
    let country: String
    let costPerLaunch: Int
    let firstStage: FirstStage
    let secondStage: SecondStage
    
    var randomFlickrImage: String {
        flickrImages.randomElement() ?? ""
    }
    
    var formatCostLaunch: String {
        return String(format: "$%.0x млн", costPerLaunch / 1000000)
    }
    
    enum CodingKeys: String, CodingKey {
        
        case flickrImages = "flickr_images"
        case name
        case height
        case diameter
        case mass
        case payloadWeights = "payload_weights"
        case firstFlight = "first_flight"
        case country
        case costPerLaunch = "cost_per_launch"
        case firstStage = "first_stage"
        case secondStage = "second_stage"
    }
}

struct Height: Decodable {
    
    let meters: Double?
    let feet: Double?
    
    var formatHeightM: String {
        return String(format: "%.1f", meters!)
    }
    
    var formatHeightF: String {
        return String(format: "%.1f", feet!)
    }
}

struct Diameter: Decodable {
    
    let meters: Double?
    let feet: Double?
    
    var formatDiameterM: String {
        return String(format: "%.1f", meters!)
    }
    
    var formatDiameterF: String {
        return String(format: "%.1f", feet!)
    }
}

struct Mass: Decodable {
    
    let kg: Double
    let lb: Double
    
    var formatMassK: String {
        return String(format: "%.3f", kg)
    }
    
    var formatMassL: String {
        return String(format: "%.3f", lb)
    }
}

struct PayloadWeights: Decodable {
    
    let kg: Int
    let lb: Int
    
    var formatPayloadK: String {
        return String(format: "%.3f", kg)
    }
    
    var formatPayloadL: String {
        return String(format: "%.3f", lb)
    }
}

struct FirstStage: Decodable {
    
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSEC: Int?
    
    var formatEngines: String {
        return String(engines)
    }
    
    var formatFuel: String {
        return String(format: "%.1f", fuelAmountTons)
    }
    
    var formatBurn: String {
        return String(burnTimeSEC!)
    }

    enum CodingKeys: String, CodingKey {
        
        case engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}

struct SecondStage: Decodable {
    
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSEC: Int?
    
    var formatSecondEngines: String {
        return String(engines)
    }
    
    var formatSecondFuel: String {
        return String(format: "%.1f", fuelAmountTons)
    }
    
    var formatSecondBurn: String {
        return String(burnTimeSEC!)
    }
    
    enum CodingKeys: String, CodingKey {
        
        case engines
        case fuelAmountTons = "fuel_amount_tons"
        case burnTimeSEC = "burn_time_sec"
    }
}

//  https://api.spacexdata.com/v4/rockets
