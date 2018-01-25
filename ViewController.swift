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
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var helpButton: FloatingActionButton!
    
    
    var audioPlayer = AVAudioPlayer()
    var currentSong = 0
    var audioArray = ["sample", "gum"]

    var imageArray = [UIImage]()
    var timer = Timer()
    var seconds = 5
    var time2 = 10
    var randomNr = 0
    var gameNr = 0
    var teamID = 0
    
    let team1 = UIButton()
    let team2 = UIButton()
    let team3 = UIButton()
    let team4 = UIButton()
    let team5 = UIButton()
    let teamLabel1 = UILabel()
    

    
    override func viewDidAppear(_ animated: Bool) {
        let sortedByPoints = LocalDataBase().getSortedTeams()
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
        
        let stackViewWidthForEachSubview = (Int(stackView.frame.width)/LocalDataBase.teamArray.count)
        
    
        let myLabel1 = UILabel(frame: CGRect(x: 10, y: 115, width: stackViewWidthForEachSubview-20, height: 30))
        myLabel1.layer.masksToBounds = true
        myLabel1.layer.cornerRadius = 15
        myLabel1.textAlignment = .center
        myLabel1.text = LocalDataBase.teamArray[0].name
        myLabel1.font = UIFont.boldSystemFont(ofSize: 16)
        myLabel1.layer.borderColor = UIColor.black.cgColor
        myLabel1.layer.borderWidth = 1
        let myView1 = UIImageView(frame: CGRect(x: 5, y: 5, width: 35, height: 35))
        let image1 = textToImage(drawText: String(LocalDataBase.teamArray[0].points), inImage: #imageLiteral(resourceName: "gold-round-button-md"), atPoint: CGPoint(x: 90, y: 25))
        myView1.image = image1
        myView1.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha:1.0).cgColor
        myView1.layer.shadowOffset = CGSize(width:0, height:2.75)
        myView1.layer.shadowRadius = 1.75
        myView1.layer.shadowOpacity = 0.55
        team1.addSubview(myView1)
        team1.addSubview(myLabel1)
        
      

        let myLabel2 = UILabel(frame: CGRect(x: 10, y: 115, width: stackViewWidthForEachSubview-20, height: 25))
        myLabel2.layer.masksToBounds = true
        myLabel2.layer.cornerRadius = 15
        myLabel2.textAlignment = .center
        myLabel2.text = LocalDataBase.teamArray[1].name
        myLabel2.font = UIFont.boldSystemFont(ofSize: 16)
        myLabel2.layer.borderColor = UIColor.black.cgColor
        myLabel2.layer.borderWidth = 1
        let myView2 = UIImageView(frame: CGRect(x: 5, y: 5, width: 35, height: 35))
        let image2 = textToImage(drawText: String(LocalDataBase.teamArray[1].points), inImage: #imageLiteral(resourceName: "gold-round-button-md"), atPoint: CGPoint(x: 90, y: 25))
        myView2.image = image2
        myView2.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha:1.0).cgColor
        myView2.layer.shadowOffset = CGSize(width:0, height:2.75)
        myView2.layer.shadowRadius = 1.75
        myView2.layer.shadowOpacity = 0.55
        team2.addSubview(myView2)
        team2.addSubview(myLabel2)
        
        if (LocalDataBase.teamArray.count >= 3){
            let myLabel3 = UILabel(frame: CGRect(x: 10, y: 115, width: stackViewWidthForEachSubview-20, height: 25))
            myLabel3.layer.masksToBounds = true
            myLabel3.layer.cornerRadius = 15
            myLabel3.textAlignment = .center
            myLabel3.text = LocalDataBase.teamArray[2].name
            myLabel3.font = UIFont.boldSystemFont(ofSize: 16)
            myLabel3.layer.borderColor = UIColor.black.cgColor
            myLabel3.layer.borderWidth = 1
            
            let myView3 = UIImageView(frame: CGRect(x: 5, y: 5, width: 35, height: 35))
            let image3 = textToImage(drawText: String(LocalDataBase.teamArray[2].points), inImage: #imageLiteral(resourceName: "gold-round-button-md"), atPoint: CGPoint(x: 90, y: 25))
            myView3.image = image3
            myView3.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha:1.0).cgColor
            myView3.layer.shadowOffset = CGSize(width:0, height:2.75)
            myView3.layer.shadowRadius = 1.75
            myView3.layer.shadowOpacity = 0.55
            team3.addSubview(myView3)
            team3.addSubview(myLabel3)
        }
        if (LocalDataBase.teamArray.count >= 4){
            let myLabel4 = UILabel(frame: CGRect(x: 10, y: 115, width: stackViewWidthForEachSubview-20, height: 25))
            myLabel4.layer.masksToBounds = true
            myLabel4.layer.cornerRadius = 15
            myLabel4.textAlignment = .center
            myLabel4.text = LocalDataBase.teamArray[3].name
            myLabel4.font = UIFont.boldSystemFont(ofSize: 16)
            myLabel4.layer.borderColor = UIColor.black.cgColor
            myLabel4.layer.borderWidth = 1
           
            let myView4 = UIImageView(frame: CGRect(x: 5, y: 5, width: 35, height: 35))
            let image4 = textToImage(drawText: String(LocalDataBase.teamArray[3].points), inImage: #imageLiteral(resourceName: "gold-round-button-md"), atPoint: CGPoint(x: 90, y: 25))
            myView4.image = image4
            myView4.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha:1.0).cgColor
            myView4.layer.shadowOffset = CGSize(width:0, height:2.75)
            myView4.layer.shadowRadius = 1.75
            myView4.layer.shadowOpacity = 0.55
            team4.addSubview(myView4)
            team4.addSubview(myLabel4)
        }
        if (LocalDataBase.teamArray.count >= 5){
            let myLabel5 = UILabel(frame: CGRect(x: 10, y: 115, width: stackViewWidthForEachSubview-30, height: 25))
            myLabel5.layer.masksToBounds = true
            myLabel5.layer.cornerRadius = 15
            myLabel5.textAlignment = .center
            myLabel5.text = LocalDataBase.teamArray[4].name
            myLabel1.font = UIFont.boldSystemFont(ofSize: 16)
            myLabel1.layer.borderColor = UIColor.black.cgColor
            myLabel1.layer.borderWidth = 1
            let myView5 = UIImageView(frame: CGRect(x: 5, y: 5, width: 35, height: 35))
            let image5 = textToImage(drawText: String(LocalDataBase.teamArray[4].points), inImage: #imageLiteral(resourceName: "gold-round-button-md"), atPoint: CGPoint(x: 90, y: 25))
            myView5.image = image5
            myView5.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha:1.0).cgColor
            myView5.layer.shadowOffset = CGSize(width:0, height:2.75)
            myView5.layer.shadowRadius = 1.75
            myView5.layer.shadowOpacity = 0.55
            team5.addSubview(myView5)
            team5.addSubview(myLabel5)
        }
        
        
        
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
        let teams = LocalDataBase.teamArray.count
        let color1 = UIColor(hexString: "#b31217")
        
        
        for team in LocalDataBase().getSortedTeams(){
            if (team.isUp){
                teamID = team.id
                buttonArray[team.id].backgroundColor = color1
                buttonArray[team.id].pulsateTeam()
            }
        }
        
        //Place teamImages on screen in order by points
        
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.isHidden = true
        label.layer.cornerRadius = 10.0
        imageArray = [#imageLiteral(resourceName: "brandman"),#imageLiteral(resourceName: "brandbil"),#imageLiteral(resourceName: "giraff"),#imageLiteral(resourceName: "elefant"),#imageLiteral(resourceName: "hellikopter")]
        button.setBackgroundImage(#imageLiteral(resourceName: "mario"), for: .normal)
        for team in LocalDataBase.teamArray{
            if (team.isUp == true){
                teamID = team.id
            }
        textView.text = LocalDataBase().setLabelTextUnderStartButton(team: LocalDataBase.teamArray[teamID], nrOfRounds: LocalDataBase.nrOfRounds, sortedTeamArray: LocalDataBase().getSortedTeams())
        }
       
        let color1 = UIColor(hexString: "#870000")
        let color2 = UIColor(hexString: "#190a05")
        
        helpButton.setGradientBackground(colorOne: color1, colorTwo: color2)
        
    }
    
    
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            textView.isHidden = true
            timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(ViewController.clock), userInfo: nil, repeats: true)
            timer.fire()
        }
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        textView.isHidden = true
        timer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(ViewController.clock), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    
    func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = UIColor.black
        let textFont = UIFont(name: "Helvetica Bold", size: 150)!
        
        
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        
        let textFontAttributes = [
            NSAttributedStringKey.font: textFont,
            NSAttributedStringKey.foregroundColor: textColor,
            ] as [NSAttributedStringKey : Any]
        
        image.draw(in: CGRect(origin: .zero, size: image.size))
        
        let rect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        return newImage!
    }
    
    
    @objc func clock() {
        currentSong = 0
        button.isEnabled = false
        
        playMusic()
        let random = Int(arc4random_uniform(UInt32(LocalDataBase.keysOfGamesArray.count)))
        
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
        button.setBackgroundImage(imageArray[randomNr], for: .normal)
        button.pulsate()
        
        
        if (seconds == 0){
            button.pulsateSelected()
            audioPlayer.stop()
            timer.invalidate()
            currentSong = 1
            playMusic()
            timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(ViewController.wait), userInfo: nil, repeats: true)
        }
    }
    
    @objc func wait(){
        time2 = time2-1
        label.isHidden = false
        label.layer.cornerRadius = 10
        label.text = LocalDataBase.keysOfGamesArray[randomNr]
        gameNr = randomNr
        

        if(time2 == 0){
            timer.invalidate()
            audioPlayer.stop()
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
    
    @objc func buttonAction(sender: UIButton!) {
        let btnTag: UIButton = sender
        teamID = btnTag.tag-1
        performSegue(withIdentifier: "showPlayersSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? popUpViewController {
            destination.gameNumber = gameNr
            
            destination.teamID = teamID
        }
        
        if let destination = segue.destination as? showTeamsViewController {
            destination.teamID = teamID
        }
        
    }
}

