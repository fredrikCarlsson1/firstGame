//
//  ViewController.swift
//  game
//
//  Created by Fredrik Carlsson on 2018-01-09.
//  Copyright © 2018 Fredrik Carlsson. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    var currentSong = 0
    var audioArray = ["sample", "gum"]
    
    

    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var array = [UIImage]()
    var timer = Timer()
    var seconds = 5
    var time2 = 10
    var randomNr = 0
    
    
    @IBAction func startButton(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(ViewController.clock), userInfo: nil, repeats: true)
        timer.fire()
        
    }
    
    
    @objc func clock() {
        currentSong = 0
        button.isEnabled = false
        
        playMusic()
        let random = Int(arc4random_uniform(4))
        
        if(random != randomNr){
            randomNr = random
        }
        else if (random == randomNr && random != 4){
            randomNr = random+1
        }
        else if(random == randomNr && randomNr == 4){
            randomNr = random-1
        }
        
        seconds = seconds-1
        button.setBackgroundImage(array[randomNr], for: .normal)
        button.pulsate()
        
        
        if (seconds == 0){
            button.pulsateSelected()
            audioPlayer.stop()
            currentSong = 1
            label.text = String(randomNr)
            seconds = 10
            timer.invalidate()
            currentSong = 1
            playMusic()
            timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(ViewController.wait), userInfo: nil, repeats: true)
        }
    }
    
    @objc func wait(){
        time2 = time2-1
        label.isHidden = false
        if (label.text == "0"){
            label.backgroundColor = UIColor.cyan
            label.text = "With other words!"
        }
        if (label.text == "1"){
            label.backgroundColor = UIColor.green
            label.text = "Charades"
        }
        if (label.text == "2"){
            label.backgroundColor = UIColor.purple
            label.text = "Can you guess it?"
        }
        if (label.text == "3"){
            label.backgroundColor = UIColor.yellow
            label.text = "Hum the song"
        }
        if (label.text == "4"){
            label.backgroundColor = UIColor.lightGray
            label.text = "Explain by drawing"
        }
        if(time2 == 0){
            time2 = 1
            timer.invalidate()
            performSegue(withIdentifier: "popUpSegue", sender: self)
        }
    }
    func playMusic(){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: audioArray[currentSong], ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        }
        catch{
            print(error)
        }
        audioPlayer.play()
    }
    
    
    var teamID = 0
    
    let team1 = UIButton()
    let team2 = UIButton()
    let team3 = UIButton()
    let team4 = UIButton()
    let team5 = UIButton()
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        team1.setBackgroundImage(#imageLiteral(resourceName: "elefant"), for: .normal)
        team1.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        team2.setBackgroundImage(#imageLiteral(resourceName: "giraff"), for: .normal)
        team2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        team3.setBackgroundImage(#imageLiteral(resourceName: "elefant"), for: .normal)
        team3.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        team4.setBackgroundImage(#imageLiteral(resourceName: "giraff"), for: .normal)
        team4.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        team5.setBackgroundImage(#imageLiteral(resourceName: "mario"), for: .normal)
        team5.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        team1.tag = 1
        team2.tag = 2
        team3.tag = 3
        team4.tag = 4
        team5.tag = 5
        team1.layer.cornerRadius = 50
        team2.layer.cornerRadius = 50
        team3.layer.cornerRadius = 50
        team4.layer.cornerRadius = 50
        team5.layer.cornerRadius = 50
        var buttonArray = [team1, team2, team3, team4, team5]
        
       


        //TODO----------------------
        
        let teams = LocalDataBase.teamArray.count
        let sortedByPoints = LocalDataBase().getSortedTeams()
        
        for team in LocalDataBase().getSortedTeams(){
            if (team.isUp){
                teamID = team.id
                buttonArray[team.id].backgroundColor = UIColor.red
                buttonArray[team.id].pulsateTeam()
                }
            }
        
        //-------------------------
        
        
        //TODO----------------------
        
        if(teams == 2){
            
            stackView.insertArrangedSubview(buttonArray[sortedByPoints[0].id], at: 0)
            stackView.insertArrangedSubview(buttonArray[sortedByPoints[1].id], at: 1)
            
        }
        
        if(teams == 3){
            stackView.insertArrangedSubview(buttonArray[sortedByPoints[0].id], at: 0)
            stackView.insertArrangedSubview(buttonArray[sortedByPoints[1].id], at: 1)
            stackView.insertArrangedSubview(buttonArray[sortedByPoints[2].id], at: 2)
            stackView.insertArrangedSubview(buttonArray[sortedByPoints[1].id], at: 1)
            
        }
        if(teams == 4){
            stackView.insertArrangedSubview(buttonArray[sortedByPoints[0].id], at: 0)
            stackView.insertArrangedSubview(buttonArray[sortedByPoints[1].id], at: 1)
            stackView.insertArrangedSubview(buttonArray[sortedByPoints[2].id], at: 2)
            stackView.insertArrangedSubview(buttonArray[sortedByPoints[3].id], at: 3)
            
        }
        if(teams == 5){
            stackView.insertArrangedSubview(buttonArray[sortedByPoints[0].id], at: 0)
            stackView.insertArrangedSubview(buttonArray[sortedByPoints[1].id], at: 1)
            stackView.insertArrangedSubview(buttonArray[sortedByPoints[2].id], at: 2)
            stackView.insertArrangedSubview(buttonArray[sortedByPoints[3].id], at: 3)
            stackView.insertArrangedSubview(buttonArray[sortedByPoints[4].id], at: 4)
            
        }
        //--------------------------------
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.isHidden = true
        label.layer.cornerRadius = 10.0
        label.layer.opacity = 0.75
        array = [#imageLiteral(resourceName: "brandman"),#imageLiteral(resourceName: "brandbil"),#imageLiteral(resourceName: "giraff"),#imageLiteral(resourceName: "elefant"),#imageLiteral(resourceName: "hellikopter")]
        button.setBackgroundImage(#imageLiteral(resourceName: "mario"), for: .normal)
        

        
        
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let btnTag: UIButton = sender
        teamID = btnTag.tag-1
        performSegue(withIdentifier: "showPlayersSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? popUpViewController {
            destination.number = label.text
            destination.teamID = teamID
        }
        
        if let destination = segue.destination as? showTeamsViewController {
            destination.teamID = teamID
        }
        
    }
}

