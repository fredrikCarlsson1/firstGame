//
//  WordsCharadesHum.swift
//  game
//
//  Created by Fredrik Carlsson on 2018-01-18.
//  Copyright © 2018 Fredrik Carlsson. All rights reserved.
//

import UIKit
import AVFoundation

class WordsCharadesHum: UIViewController {
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkBox1: BEMCheckBox!
    @IBOutlet weak var checkBox2: BEMCheckBox!
    @IBOutlet weak var checkBox3: BEMCheckBox!
    @IBOutlet weak var checkBox4: BEMCheckBox!
    @IBOutlet weak var checkBox5: BEMCheckBox!
    @IBOutlet weak var gameView: UIView!
    @IBOutlet weak var startingView: UIViewX!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    
    
    var timer = Timer()
    var seconds = 45
    var soundPlayer = AVAudioPlayer()
    var audioArray = ["airHorn"]
    
    var score = 0
    var teamID: Int?
    var game: Int?
    var titleNumber: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let typeOfGame = game{
            if (typeOfGame == 0){
                
            }
        }
        
        timeLabel.layer.masksToBounds = true
        timeLabel.layer.cornerRadius = 25
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(WordsCharadesHum.startTimer), userInfo: nil, repeats: true)
        
        if let game = game {
            if let gameNumber = titleNumber{
            gameLabel.text = LocalDataBase.keysOfGamesArray[game]
            
            if let title = titleNumber {
                    titleLabel.text = LocalDataBase().getRandomSubjectFrom(list: game, index: title)
            }
            if (game == 0){
                titleLabel.text = LocalDataBase().withOtherWordsList[gameNumber].title
                label1.text = LocalDataBase().withOtherWordsList[gameNumber].word1
                label2.text = LocalDataBase().withOtherWordsList[gameNumber].word2
                label3.text = LocalDataBase().withOtherWordsList[gameNumber].word3
                label4.text = LocalDataBase().withOtherWordsList[gameNumber].word4
                label5.text = LocalDataBase().withOtherWordsList[gameNumber].word5
                
              
            }
            else if(game == 1){
                titleLabel.text = LocalDataBase().charadeList[gameNumber].title
                label1.text = LocalDataBase().charadeList[gameNumber].word1
                label2.text = LocalDataBase().charadeList[gameNumber].word2
                label3.text = LocalDataBase().charadeList[gameNumber].word3
                label4.text = LocalDataBase().charadeList[gameNumber].word4
                label5.text = LocalDataBase().charadeList[gameNumber].word5
                
            }
            else if(game == 4){
                titleLabel.text = LocalDataBase().humTheSongList[gameNumber].title
                label1.text = LocalDataBase().humTheSongList[gameNumber].word1
                label2.text = LocalDataBase().humTheSongList[gameNumber].word2
                label3.text = LocalDataBase().humTheSongList[gameNumber].word3
                label4.text = LocalDataBase().humTheSongList[gameNumber].word4
                label5.text = LocalDataBase().humTheSongList[gameNumber].word5
                }
            }
        }
        
        //UI ------------
        gameView.layer.cornerRadius = 20
        gameView.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha:1.0).cgColor
        gameView.layer.shadowOffset = CGSize(width:0, height:2.75)
        gameView.layer.shadowRadius = 1.75
        gameView.layer.shadowOpacity = 0.45
      
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.transition(from: startingView, to: gameView, duration: 0.4, options: [.transitionFlipFromLeft, .showHideTransitionViews])
        
    }
    
    
    @IBAction func doneButton(_ sender: UIButton) {
        performSegue(withIdentifier: "wordsCharHumToModalSegue", sender: self)
    }
    
    
    
    @IBAction func checkBox1Button(_ sender: BEMCheckBox) {
        if(checkBox1.on == true){
            score = score+1
        } else if(checkBox1.on == false){
            score = score-1
        }
        if(checkBox1.on == true &&
            checkBox2.on == true &&
            checkBox3.on == true &&
            checkBox4.on == true &&
            checkBox5.on == true){
            performSegue(withIdentifier: "wordsCharHumToModalSegue", sender: self)
        }
    }
    
    @IBAction func checkBox2Button(_ sender: BEMCheckBox) {
        if(checkBox2.on == true){
            score = score+1
        } else if(checkBox2.on == false){
            score = score-1
        }
        if(checkBox1.on == true &&
            checkBox2.on == true &&
            checkBox3.on == true &&
            checkBox4.on == true &&
            checkBox5.on == true){
            performSegue(withIdentifier: "wordsCharHumToModalSegue", sender: self)
        }
    }
    
    @IBAction func checkBox3Button(_ sender: BEMCheckBox) {
        if(checkBox3.on == true){
            score = score+1
        } else if(checkBox3.on == false){
            score = score-1
        }
        if(checkBox1.on == true &&
            checkBox2.on == true &&
            checkBox3.on == true &&
            checkBox4.on == true &&
            checkBox5.on == true){
            performSegue(withIdentifier: "wordsCharHumToModalSegue", sender: self)
        }
    }
    
    @IBAction func checkBox4Button(_ sender: BEMCheckBox) {
        if(checkBox4.on == true){
            score = score+1
        } else if(checkBox4.on == false){
            score = score-1
        }
        if(checkBox1.on == true &&
            checkBox2.on == true &&
            checkBox3.on == true &&
            checkBox4.on == true &&
            checkBox5.on == true){
            performSegue(withIdentifier: "wordsCharHumToModalSegue", sender: self)
        }
    }
    
    @IBAction func checkBox5Button(_ sender: BEMCheckBox) {
        if(checkBox5.on == true){
            score = score+1
        } else if(checkBox5.on == false){
            score = score-1
        }
        
        if(checkBox1.on == true &&
            checkBox2.on == true &&
            checkBox3.on == true &&
            checkBox4.on == true &&
            checkBox5.on == true){
            performSegue(withIdentifier: "wordsCharHumToModalSegue", sender: self)
        }
    }
 
    
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
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ModalViewPopUp {
            destination.points = score
            if let team = teamID{
            destination.teamID = team
            }
         
            
           // destination.time = timeLabel.text
            
        }
        
    }

}
