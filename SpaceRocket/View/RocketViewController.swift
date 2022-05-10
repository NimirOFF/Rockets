//
//  ViewController.swift
//  SpaceRocket
//
//  Created by Ravil Khayretdinov on 02.05.2022.
//

import UIKit

class RocketViewController: UIViewController {
    
    var presenter: RocketViewPresenterProtocol!

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var rocketImage: UIImageView!
    @IBOutlet weak var rocketName: UILabel!
    @IBOutlet weak var firstLaunch: UILabel!
    @IBOutlet weak var rocketCountry: UILabel!
    @IBOutlet weak var costLaunch: UILabel!
    
    @IBOutlet weak var engineLabel: UILabel!
    @IBOutlet weak var fuelLabel: UILabel!
    @IBOutlet weak var burnLabel: UILabel!
    
    @IBOutlet weak var secondEngineLabel: UILabel!
    @IBOutlet weak var secondFuelLabel: UILabel!
    @IBOutlet weak var secondBurnLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        success()
        
    }
}

extension RocketViewController: RocketViewProtocol {
    
    func success() {
        self.rocketName.text = presenter.rockets?.first?.name
        self.firstLaunch.text = presenter.rockets?.first?.firstFlight
        self.rocketCountry.text = presenter.rockets?.first?.country
        self.costLaunch.text = presenter.rockets?.first?.formatCostLaunch
        
        self.engineLabel.text = presenter.rockets?.first?.firstStage.formatEngines ?? "0"
        self.fuelLabel.text = presenter.rockets?.first?.firstStage.formatFuel ?? "0"
        self.burnLabel.text = presenter.rockets?.first?.firstStage.formatBurn ?? "0"
        
        self.secondEngineLabel.text = presenter.rockets?.first?.secondStage.formatSecondEngines ?? "0"
        self.secondFuelLabel.text = presenter.rockets?.first?.secondStage.formatSecondFuel ?? "0"
        self.secondBurnLabel.text = presenter.rockets?.first?.secondStage.formatSecondBurn ?? "0"
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}

//extension RocketViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        return 4
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "infoCell", for: indexPath) as! RocketCollectionViewCell
//        return cell
//    }
//}

