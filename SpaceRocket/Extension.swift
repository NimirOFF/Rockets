//
//  Extension.swift
//  SpaceRocket
//
//  Created by Ravil Khayretdinov on 10.05.2022.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        
        get  { return self.cornerRadius }
        
        set { self.layer.cornerRadius = newValue }
    }
    
}
