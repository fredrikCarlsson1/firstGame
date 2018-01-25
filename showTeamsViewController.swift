//
//  showTeamsViewController.swift
//  game
//
//  Created by Fredrik Carlsson on 2018-01-16.
//  Copyright © 2018 Fredrik Carlsson. All rights reserved.
//

import UIKit

class showTeamsViewController: UIViewController {

    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    

    
    var teamID: Int?
    var i = 1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        if let index = teamID {
            teamLabel.text = String(LocalDataBase.teamArray[index].id)
            scoreLabel.text = String(LocalDataBase.teamArray[index].points)
            
                for player in LocalDataBase.teamArray[index].players {
                    let label = UILabel(frame: CGRect(x: 0, y: (100*(i)), width: 200, height: 21))
                    label.textAlignment = .center
                    label.text = player.name
                    self.view.addSubview(label)
                    i=i+1
                
            }
        }
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)

    }
    

    
}
