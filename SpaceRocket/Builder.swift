//
//  Builder.swift
//  SpaceRocket
//
//  Created by Ravil Khayretdinov on 03.05.2022.
//

import UIKit

protocol Builder {
    
    static func createMainView() -> UIViewController
}

class MainBuilder: Builder {
    
    static func createMainView() -> UIViewController {
        let view = RocketViewController()
        let networkService = NetworkService()
        let presenter = RocketPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
}
