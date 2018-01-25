//
//  popUpViewController.swift
//  game
//
//  Created by Fredrik Carlsson on 2018-01-09.
//  Copyright © 2018 Fredrik Carlsson. All rights reserved.
//

import UIKit
import AVFoundation

class popUpViewController: UIViewController {
    
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var popUpLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var popUpTitleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var buttonPressedView: UIView!
    @IBOutlet weak var scoreButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var x2Outlet: FloatingActionButton!
    @IBOutlet weak var switchOutlet: FloatingActionButton!
    @IBOutlet weak var removePoints: FloatingActionButton!
    
    var dataBase = LocalDataBase()
    var gameNumber: Int?
    var teamID: Int?
    var score = 0
    let random = 0
    var subjectNumber = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ------UI---------
        
        mainView.layer.cornerRadius = 20
        popUpView.layer.cornerRadius = 20
        popUpView.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha:1.0).cgColor
        popUpView.layer.shadowOffset = CGSize(width:0, height:2.75)
        popUpView.layer.shadowRadius = 1.75
        popUpView.layer.shadowOpacity = 0.45
        
        
        
        
        let path = UIBezierPath(roundedRect: popUpLabel.bounds,
                                byRoundingCorners:[.topRight, .topLeft],
                                cornerRadii: CGSize(width: 15, height:  15))
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        popUpLabel.layer.mask = maskLayer
        popUpLabel.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha:1.0).cgColor
        popUpLabel.layer.shadowOffset = CGSize(width:0, height:2.75)
        popUpLabel.layer.shadowRadius = 1.75
        popUpLabel.layer.shadowOpacity = 0.45
        
        
        
        closeMenu()
        buttonPressedView.layer.cornerRadius = 150
        
        if let gameNumber = gameNumber {
            popUpLabel.text = LocalDataBase.keysOfGamesArray[gameNumber]
            subjectNumber = LocalDataBase().getRandomNumberForEachList(index: gameNumber)
            popUpTitleLabel.text = LocalDataBase().getRandomSubjectFrom(list: gameNumber, index: subjectNumber)
            
            if let teamID = teamID{
                textView.text = LocalDataBase().setTextViewInPopUp(team: LocalDataBase.teamArray[teamID], gameNumber: gameNumber, title: popUpTitleLabel.text!)
            }
            
        }
    }
    
    @IBAction func x2pointsButton(_ sender: UIButton) {
        if let team = teamID {
        if(LocalDataBase.teamArray[team].x2 == true){
        LocalDataBase.teamArray[team].x2Available = false
        LocalDataBase.teamArray[team].x2 = false
            print(LocalDataBase.teamArray[team].x2Available)
            switchOutlet.isEnabled = false
            removePoints.isEnabled = false
        }
        else if(LocalDataBase.teamArray[team].x2 == false){
                LocalDataBase.teamArray[team].x2Available = true
                LocalDataBase.teamArray[team].x2 = true
                print(LocalDataBase.teamArray[team].x2Available)
                switchOutlet.isEnabled = true
                removePoints.isEnabled = true
            }
        }
    }
    
    @IBAction func switchButton(_ sender: UIButton) {
    }
    @IBAction func stealPointsButton(_ sender: UIButton) {
    }
    
    @IBAction func startGameButton(_ sender: UIButton) {
        if let number = gameNumber{
            if (number == 0 || number == 1 || number == 4){
                performSegue(withIdentifier: "wordsCharadesHumSegue", sender: self)
            }
            else if(number == 2){
                performSegue(withIdentifier: "teamChallangeSegue", sender: self)
            }
            else{
                performSegue(withIdentifier: "figureItOutSegue", sender: self)
            }
        }
        
     
    }
    

    @IBAction func button(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, animations: {
            if(self.buttonPressedView.transform == .identity){
                self.closeMenu()
            }
            else {
                self.buttonPressedView.transform = .identity
            }
            
        })
        
        UIView.animate(withDuration: 0.6, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
            if(self.buttonPressedView.transform == .identity){
                self.helpButton.transform = .identity
                self.scoreButton.transform = .identity
                self.exitButton.transform = .identity
            }
        })
    }
    
    func closeMenu(){
        self.buttonPressedView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        self.helpButton.transform = CGAffineTransform(translationX: -11, y: 11)
        self.exitButton.transform = CGAffineTransform(translationX: 0, y: 15)
        self.scoreButton.transform = CGAffineTransform(translationX: -15, y: 0)
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? WordsCharadesHum{
            destination.teamID = teamID
            destination.game = gameNumber
            destination.titleNumber = subjectNumber
        }
        if let destination = segue.destination as? TeamChallengePopUp{
            destination.teamID = teamID
            destination.game = gameNumber
            destination.titleNumber = subjectNumber
        }
        if let destination = segue.destination as? CanYouFigureItOutPopUp{
            destination.teamID = teamID
            destination.game = gameNumber
            destination.titleNumber = subjectNumber
        }
    }
}


