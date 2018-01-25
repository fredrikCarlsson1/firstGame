//
//  ModalViewPopUp.swift
//  game
//
//  Created by Fredrik Carlsson on 2018-01-17.
//  Copyright © 2018 Fredrik Carlsson. All rights reserved.
//

import UIKit

class ModalViewPopUp: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    var teamID: Int?
    var points: Int?
    var time: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func continueButton(_ sender: UIButton) {
        if let team = teamID{
            if let p = points{
                LocalDataBase.nrOfRounds = LocalDataBase.nrOfRounds + 1
                LocalDataBase.teamArray[team].addPoints(p)
                LocalDataBase.teamArray[team].isUp = false
                LocalDataBase.teamArray[getNextTeam(teamID: team)].isUp = true
            }
        }
        performSegue(withIdentifier: "backToStartSegue", sender: self)
    }
    
    @IBAction func editScroreButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func getNextTeam(teamID: Int) -> Int{
        let nrOfTeams = LocalDataBase.teamArray.count
        if(teamID == (nrOfTeams-1)){
            return 0
        }
        else{
            return (teamID + 1)
        }
    }
    
}
