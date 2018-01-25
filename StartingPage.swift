//
//  StartingPage.swift
//  game
//
//  Created by Fredrik Carlsson on 2018-01-18.
//  Copyright © 2018 Fredrik Carlsson. All rights reserved.
//

import UIKit

class StartingPage: UIViewController {

    @IBOutlet weak var uiView: UIViewX!
    @IBOutlet weak var startButton: UIButton!
    
    var colorArray: [(color1: UIColor, color2: UIColor)] = []
    
    let c1 = UIColor.init(hexString: "#cb356b")
    let c2 = UIColor.init(hexString: "#bd3f32")
    let c3 = UIColor.init(hexString: "#f3904f")
    let c4 = UIColor.init(hexString: "#3b4371")
    let c5 = UIColor.init(hexString: "#642b73")
    let c6 = UIColor.init(hexString: "#c6426e")
    let c7 = UIColor.init(hexString: "#283c86")
    let c8 = UIColor.init(hexString: "#45a247")
    let c9 = UIColor.init(hexString: "#000000")
    let c10 = UIColor.init(hexString: "#0f9b0f")
    let c11 = UIColor.init(hexString: "#EF3B36")
    let c12 = UIColor.init(hexString: "#EF3B36")
    
    let color1 = UIColor(hexString: "#A73737")
    let color2 = UIColor(hexString: "#7A2828")
    
    
    var colorIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.pulsateSlow()
        colorArray.append((color1: c1, color2: c2))
        colorArray.append((color1: c3, color2: c4))
        colorArray.append((color1: c5, color2: c6))
        colorArray.append((color1: c7, color2: c8))
        colorArray.append((color1: c9, color2: c10))
        colorArray.append((color1: c11, color2: c12))
        
        startButton.setGradientBackground(colorOne: color1 , colorTwo: color2)
        
        startButton.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha:1.0).cgColor
        startButton.layer.shadowOffset = CGSize(width:0, height:2.75)
        startButton.layer.shadowRadius = 1.75
        startButton.layer.shadowOpacity = 0.45
  
        animateBackGroundColor()
        
    }
    
    @IBAction func startBut(_ sender: UIButton) {
      performSegue(withIdentifier: "startToAddPlayerSegue", sender: self)
    }
    
   
    func animateBackGroundColor(){
        colorIndex = colorIndex + 1
        if (colorIndex == colorArray.count-1){
            colorIndex = 0
        }

        UIView.transition(with: self.uiView, duration: 3, options: [.transitionCrossDissolve, .allowUserInteraction], animations: {
            self.uiView.firstColor = self.colorArray[self.colorIndex].color1; self.uiView.secondColor = self.colorArray[self.colorIndex].color2
        }){ (success) in
            self.animateBackGroundColor()
            }
        
    }
    
    
    


}
