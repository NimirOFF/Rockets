//
//  RocketPresenter.swift
//  SpaceRocket
//
//  Created by Ravil Khayretdinov on 03.05.2022.
//

import Foundation

protocol RocketViewProtocol {
    
    func success()
    func failure(error: Error)
}

protocol RocketViewPresenterProtocol {
    
    init(view: RocketViewProtocol, networkService: NetworkServiceProtocol)
    var rockets: [RocketData]? { get }
    func getRockets()
}

class RocketPresenter: RocketViewPresenterProtocol {
    
    var view: RocketViewProtocol
    let networkService: NetworkServiceProtocol!
    var rockets: [RocketData]?
    
    required init(view: RocketViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getRockets()
    }
    
    func getRockets() {
        networkService.fetchRockets { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case.success(let rockets):
                    self.rockets = rockets
                    self.view.success()
                case.failure(let error):
                    self.view.failure(error: error)
                }
            }
        }
    }
}

