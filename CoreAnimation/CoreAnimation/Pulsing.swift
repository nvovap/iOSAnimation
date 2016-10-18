//
//  Pulsing.swift
//  CoreAnimation
//
//  Created by nvovap on 10/18/16.
//  Copyright © 2016 nvovap. All rights reserved.
//

import UIKit

class Pulsing: CALayer {
    
    var animationGroup = CAAnimationGroup()
    
    var initionPulsScale: Float = 0
    var nextPulseAfter: TimeInterval = 0
    var animationDuration: TimeInterval = 1.5
    var radios: CGFloat = 200
    var numberOfPulses: Float = Float.infinity
    
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    
    init (numberOfPulses: Float = Float.infinity, radios: CGFloat, position: CGPoint) {
        super.init()
        
        self.backgroundColor = UIColor.black.cgColor
        
        self.contentsScale = UIScreen.main.scale
        self.opacity = 0
        self.radios = radios
        self.numberOfPulses = numberOfPulses
        self.position = position
        
        self.bounds = CGRect(x: 0, y: 0, width: radios*2, height: radios*2)
        self.cornerRadius = radios
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            self.setupAnimationGroup()
            
            DispatchQueue.main.async {
                self.add(self.animationGroup, forKey: "pulse")
            }
        }
        
        
        
        
    }
    
    
    func setupAnimationGroup() {
        self.animationGroup = CAAnimationGroup()
        self.animationGroup.duration = animationDuration + nextPulseAfter
        self.animationGroup.repeatCount = numberOfPulses
        
        
        let defaultCurve = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        self.animationGroup.timingFunction = defaultCurve
        
        self.animationGroup.animations = [createScaleAnimation(), createOpacityAnimation()]
        
        
    }
    
    func createScaleAnimation() -> CABasicAnimation {
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale.xy")
        
        scaleAnimation.fromValue = NSNumber(value: initionPulsScale)
        scaleAnimation.toValue = NSNumber(value: 1)
        scaleAnimation.duration = animationDuration
        
        return scaleAnimation
        
    }
    
    func createOpacityAnimation() -> CAKeyframeAnimation {

        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        
        opacityAnimation.duration = animationDuration
        opacityAnimation.values = [0.4, 0.8, 0]
        opacityAnimation.keyTimes = [0.0, 0.2, 1.0]
        
        
        
        
        
        return opacityAnimation
        
    }
  

}
