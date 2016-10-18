//
//  ShakingTextTwo.swift
//  CoreAnimation
//
//  Created by nvovap on 10/18/16.
//  Copyright © 2016 nvovap. All rights reserved.
//

import UIKit

class ShakingTextTwo: UITextField {

    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
       // animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x-4, y: self.center.y))
        animation.toValue   = NSValue(cgPoint: CGPoint(x: self.center.x+4, y: self.center.y))
        
        self.layer.add(animation, forKey: "position")
        
        
    }


}
