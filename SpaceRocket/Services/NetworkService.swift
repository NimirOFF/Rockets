//
//  NetworkService.swift
//  SpaceRocket
//
//  Created by Ravil Khayretdinov on 02.05.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    
    func fetchRockets(completion: @escaping (Result<[RocketData]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    func fetchRockets(completion: @escaping (Result<[RocketData]?, Error>) -> Void) {
        
        let urlString = "https://api.spacexdata.com/v4/rockets"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let rockets = try JSONDecoder().decode([RocketData].self, from: data!)
                completion(.success(rockets))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
