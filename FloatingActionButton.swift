//
//  FloatingActionButton.swift
//  game
//
//  Created by Fredrik Carlsson on 2018-01-16.
//  Copyright © 2018 Fredrik Carlsson. All rights reserved.
//

import UIKit

class FloatingActionButton: UIButtonX {
    
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        UIView.animate(withDuration: 0.3, animations: {
            if(self.transform == .identity){
                self.transform = CGAffineTransform(rotationAngle: 90*(.pi/180 ))
            }
            else {
                self.transform = .identity
            }
        })
        
        
        return super.beginTracking(touch, with: event)
    }
    
    
    
}
