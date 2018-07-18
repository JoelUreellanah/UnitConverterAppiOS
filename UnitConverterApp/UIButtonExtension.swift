//
//  UIButtonExtension.swift
//  UnitConverterApp
//
//  Created by joel ureellanah on 16/03/2018.
//  Copyright © 2018 joel ureellanah. All rights reserved.
//

import Foundation
import UIKit


// Animation when Button is pressed

extension UIButton {
    func shake() {
        
        let shake  = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: nil)
    }
}
