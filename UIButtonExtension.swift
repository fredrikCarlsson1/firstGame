//
//  UIButtonExtension.swift
//  game
//
//  Created by Fredrik Carlsson on 2018-01-09.
//  Copyright © 2018 Fredrik Carlsson. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func pulsate(){
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.1
        pulse.fromValue = 0.95
        pulse.toValue = 1
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: nil)
      
    }
    
    func pulsateSelected(){
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.5
        pulse.fromValue = 0.75
        pulse.toValue = 1.3
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: nil)
        
    }
    func pulsateTeam(){
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 2
        pulse.fromValue = 0.98
        pulse.toValue = 1
        pulse.autoreverses = true
        pulse.repeatCount = 10000
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: nil)
        
    }
    func pulsateSlow(){
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 2
        pulse.fromValue = 0.96
        pulse.toValue = 1
        pulse.autoreverses = true
        pulse.repeatCount = 200
        pulse.initialVelocity = 1
        pulse.damping = 2.0
        
        layer.add(pulse, forKey: nil)
        
    }
 
    
}

