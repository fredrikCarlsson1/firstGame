//
//  CanYouFigureItOutPopUp.swift
//  game
//
//  Created by Fredrik Carlsson on 2018-01-18.
//  Copyright © 2018 Fredrik Carlsson. All rights reserved.
//

import UIKit
import AVFoundation

class CanYouFigureItOutPopUp: UIViewController {
    var teamID: Int?
    var game: Int?
    var titleNumber: Int?
    var answer: String?
    var hintNumber = 5
    var timer = Timer()
    var seconds = 46
    var soundPlayer = AVAudioPlayer()
    var audioArray = ["airHorn"]
    
    
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var hintButton: UIButtonX!
    
    
    
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        pointsLabel.text = String(hintNumber)
        if let titleNr = titleNumber{
            textView.text = ("First clue: \n\(LocalDataBase().canYouFigureItOutList[titleNr].clue1) \n---\(textView.text)\n")
        }
    }
        

    @IBAction func nextHintButton(_ sender: UIButton) {
        hintNumber=hintNumber-1
        pointsLabel.text=String(hintNumber)
        if let titleNr = titleNumber{
        if(hintNumber == 4){
            textView.text = ("Second clue: \n\(LocalDataBase().canYouFigureItOutList[titleNr].clue2) \n---\(textView.text)\n")
        }
        else if(hintNumber == 3){
            textView.text = ("Third clue: \n\(LocalDataBase().canYouFigureItOutList[titleNr].clue3) \n---\(textView.text)\n")
        }
        else if(hintNumber == 2){
            textView.text = ("Fourth clue: \n\(LocalDataBase().canYouFigureItOutList[titleNr].clue4) \n---\(textView.text)\n")
        }
        else if(hintNumber == 1){
            hintButton.isEnabled = false
            textView.text = ("Fifth clue: \n\(LocalDataBase().canYouFigureItOutList[titleNr].clue5) \n---\(textView.text)\n")
            }
        }
        
    }
    
    @IBAction func guessButton(_ sender: UIButton) {
        if let titleNr = titleNumber{
            answer = LocalDataBase().canYouFigureItOutList[titleNr].answer
        }
        timer.invalidate()
        performSegue(withIdentifier: "figureToAlertSegue", sender: self)
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AlertView {
            if let team = teamID{
                destination.teamID = team
            }
            if let answer = answer{
                destination.answer = answer
            }
            if let points = pointsLabel.text{
                destination.score = Int(points)
            }
        }
    }
}
