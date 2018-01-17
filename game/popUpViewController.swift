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
    
    @IBOutlet weak var gameView: UIView!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var popUpLabel: UILabel!
    @IBOutlet weak var gameViewLabel: UILabel!
    @IBOutlet weak var categoryLabelPopUp: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var firstWordLabel: UILabel!
    @IBOutlet weak var secondWordLabel: UILabel!
    @IBOutlet weak var thirdWordLabel: UILabel!
    @IBOutlet weak var fourthWordLabel: UILabel!
    @IBOutlet weak var fifthWordLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var checkBox1: BEMCheckBox!
    @IBOutlet weak var checkBox2: BEMCheckBox!
    @IBOutlet weak var checkBox3: BEMCheckBox!
    @IBOutlet weak var checkBox4: BEMCheckBox!
    @IBOutlet weak var lastCheckBox: BEMCheckBox!
    
    var teamID: Int?
    
    
    
    @IBAction func checkBox5(_ sender: BEMCheckBox) {
        if(checkBox1.on == true &&
            checkBox2.on == true &&
            checkBox3.on == true &&
            checkBox4.on == true &&
            lastCheckBox.on == true){
            createAlert(title: "Well done!", message: "You made it! Press continue or edit your score")
            
        }
    }
    
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(ACTION) in alert.dismiss(animated: true, completion: nil)
            
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func x2pointsButton(_ sender: UIButton) {
    }
    @IBAction func switchButton(_ sender: UIButton) {
    }
    @IBAction func stealPointsButton(_ sender: UIButton) {
    }
    
    var data = [withOtherWords]()
    
    var dataBase = LocalDataBase()
    var timer = Timer()
    var seconds = 45
    var soundPlayer = AVAudioPlayer()
    var audioArray = ["airHorn"]
    func playMusic(){
        do{
            soundPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: audioArray[0], ofType: "mp3")!))
            soundPlayer.prepareToPlay()
        }
        catch{
            print(error)
        }
        soundPlayer.play()
    }
    
    @objc func startTimer() {
        seconds=seconds-1
        timeLabel.text = String(seconds)
        
        if (seconds == 0){
            playMusic()
            timer.invalidate()
            
        }
    }
    
    
    var filePath: String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        return url!.appendingPathComponent("Data").path
    }
    
    private func loadData (){
        if let ourData = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [withOtherWords]{
            data = ourData
        }
    }
    
    private func saveData (otherWords: withOtherWords){
        data.append(otherWords)
        NSKeyedArchiver.archiveRootObject(data, toFile: filePath)
    }
    
    var number: String?
    var flippedCard = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.saveData(otherWords: pits)
        
        //loadData()
        let random = Int(arc4random_uniform(4))
        
        // ------UI---------
        popUpView.layer.cornerRadius = 3
        popUpView.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha:1.0).cgColor
        popUpView.layer.shadowOffset = CGSize(width:0, height:2.75)
        popUpView.layer.shadowRadius = 1.75
        popUpView.layer.shadowOpacity = 0.45
        startButton.layer.cornerRadius = 10
        
        gameView.layer.cornerRadius = 3
        gameView.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha:1.0).cgColor
        gameView.layer.shadowOffset = CGSize(width:0, height:2.75)
        gameView.layer.shadowRadius = 1.75
        gameView.layer.shadowOpacity = 0.45
        
        timeLabel.layer.masksToBounds = true
        timeLabel.layer.cornerRadius = 25
        timeLabel.clipsToBounds = true
        
        
        if let numberToDisplay = number {
            popUpLabel.text = numberToDisplay
            
        }
        
        categoryLabelPopUp.text = dataBase.getWithOtherWords(atIndex: random).getTitle()
        
        
        gameViewLabel.text = popUpLabel.text
        categoryLabel.text = dataBase.getWithOtherWords(atIndex: random).getTitle()
        firstWordLabel.text = dataBase.getWithOtherWords(atIndex: random).getFirstWord()
        secondWordLabel.text = dataBase.getWithOtherWords(atIndex: random).getSecondWord()
        thirdWordLabel.text = dataBase.getWithOtherWords(atIndex: random).getThirdWord()
        fourthWordLabel.text = dataBase.getWithOtherWords(atIndex: random).getFourthWord()
        fifthWordLabel.text = dataBase.getWithOtherWords(atIndex: random).getFifthWord()
        
        
    }
    @IBAction func startGameButton(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(popUpViewController.startTimer), userInfo: nil, repeats: true)
        flippedCard = !flippedCard
        let fromView =  flippedCard ? popUpView : gameView
        let toView =  flippedCard ? gameView : popUpView
        UIView.transition(from: fromView!, to: toView!, duration: 0.5, options: [.transitionFlipFromLeft, .showHideTransitionViews])
    }
    
}
