//
//  AlertView.swift
//  game
//
//  Created by Fredrik Carlsson on 2018-01-19.
//  Copyright © 2018 Fredrik Carlsson. All rights reserved.
//

import UIKit

class AlertView: UIViewController {
    var score: Int?
    var teamID: Int?
    var answer: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func noButton(_ sender: UIButton) {
        score = 0
        performSegue(withIdentifier: "alertToModalSegue", sender: self)
        
    }
    
    @IBAction func yesButton(_ sender: UIButton) {
        score = 5
        performSegue(withIdentifier: "alertToModalSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ModalViewPopUp{
            if let team = teamID{
                destination.teamID = team
            }
            if let points = score{
                destination.points = points
            }
        }
    }
}
