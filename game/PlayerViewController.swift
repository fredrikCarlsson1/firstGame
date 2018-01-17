//
//  PlayerViewController.swift
//  game
//
//  Created by Fredrik Carlsson on 2018-01-14.
//  Copyright © 2018 Fredrik Carlsson. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nrOfGamesLabel: UILabel!
    @IBOutlet weak var nrOfWinsLabel: UILabel!
    
    var player: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = player?.name
        nrOfGamesLabel.text = String(describing: player?.games)
        nrOfWinsLabel.text = String(describing: player?.wins)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
