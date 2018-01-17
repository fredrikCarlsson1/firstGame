//
//  NewGameViewController.swift
//  game
//
//  Created by Fredrik Carlsson on 2018-01-15.
//  Copyright © 2018 Fredrik Carlsson. All rights reserved.
//

import UIKit

class NewGameViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBAction func nrOfTeamsButton(_ sender: UIButton) {
        nrOfTeamsPicker.isHidden = false
        
    }
    @IBOutlet weak var scrollView: UIScrollView!
    
    var random: Int?
    
    @IBAction func startGameButton(_ sender: UIButton) {
        
       
    }
    
    @IBOutlet weak var nrOfTeamsPicker: UIPickerView!
    
    let nrSelection = [2,3,4,5]
    var teamsSelected: Int? = 0
    var pictureArray = [#imageLiteral(resourceName: "giraff"), #imageLiteral(resourceName: "mario"), #imageLiteral(resourceName: "elefant"), #imageLiteral(resourceName: "brandbil"), #imageLiteral(resourceName: "brandman")]
    let team1 = UIButton()
    let team2 = UIButton()
    let team3 = UIButton()
    let team4 = UIButton()
    let team5 = UIButton()
    
    var teamID: Int?
    
    func selectStartingTeam(){
        if let rand = random{
            print(rand)
            LocalDataBase.teamArray[rand].isUp = true
        }
    }
    
    
    @objc func buttonAction(sender: UIButton!) {
        let btnTag: UIButton = sender
        teamID = btnTag.tag
        performSegue(withIdentifier: "selectPlayerSegue", sender: self)
        
    }
    
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return nrSelection.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(nrSelection[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        nrOfTeamsPicker.isHidden = true
        LocalDataBase.teamArray.removeAll()
        removeButtonsFromScreen()
        teamsSelected = Int(nrSelection[row])
        for team in 1...teamsSelected!{
            let newTeam = Team(players: nil, points: 0, id: team-1, isUp: false)
            LocalDataBase.teamArray.append(newTeam)
            
            
        }
        random = Int(arc4random_uniform(UInt32(LocalDataBase.teamArray.count)))
        selectStartingTeam()
        addButtonsToScreen()
        
        
    }
    
    
    func addButtonsToScreen(){
        let scrollWidth = scrollView.frame.size.width
        
        team1.frame = CGRect(x: scrollWidth/2-50, y: 0, width: 100, height: 100)
        team2.frame = CGRect(x: scrollWidth/2-50 , y: 150, width: 100, height: 100)
        team3.frame = CGRect(x: scrollWidth/2-50, y: 300, width: 100, height: 100)
        team4.frame = CGRect(x: scrollWidth/2-50, y: 450, width: 100, height: 100)
        team5.frame = CGRect(x: scrollWidth/2-50, y: 600, width: 100, height: 100)
        
        team1.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        team2.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        team3.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        team4.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        team5.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        team1.tag = 1
        team2.tag = 2
        team3.tag = 3
        team4.tag = 4
        team5.tag = 5
        
        
        if(teamsSelected == 2){
            
            scrollView.addSubview(team1)
            scrollView.addSubview(team2)
            
            
        }
        
        if(teamsSelected == 3){
            
            scrollView.addSubview(team1)
            scrollView.addSubview(team2)
            scrollView.addSubview(team3)
            
        }
        if(teamsSelected == 4){
            
            scrollView.addSubview(team1)
            scrollView.addSubview(team2)
            scrollView.addSubview(team3)
            scrollView.addSubview(team4)
            
        }
        if(teamsSelected == 5){
            
            scrollView.addSubview(team1)
            scrollView.addSubview(team2)
            scrollView.addSubview(team3)
            scrollView.addSubview(team4)
            scrollView.addSubview(team5)
            
        }
        
    }
    
    
    
    func removeButtonsFromScreen(){
        
        
        if(teamsSelected == 2){
            team1.removeFromSuperview()
            team2.removeFromSuperview()
            
        }
        
        if(teamsSelected == 3){
            team1.removeFromSuperview()
            team2.removeFromSuperview()
            team3.removeFromSuperview()
            
            
        }
        if(teamsSelected == 4){
            team1.removeFromSuperview()
            team2.removeFromSuperview()
            team3.removeFromSuperview()
            team4.removeFromSuperview()
            
            
        }
        if(teamsSelected == 5){
            team1.removeFromSuperview()
            team2.removeFromSuperview()
            team3.removeFromSuperview()
            team4.removeFromSuperview()
            team5.removeFromSuperview()
            
            
        }
        
    }
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        nrOfTeamsPicker.delegate = self
        nrOfTeamsPicker.dataSource = self
        
        if let number = teamsSelected{
            teamsSelected = number
            
            
        }
        
        addButtonsToScreen()
        
        team1.setBackgroundImage(#imageLiteral(resourceName: "elefant"), for: .normal)
        team2.setBackgroundImage(#imageLiteral(resourceName: "giraff"), for: .normal)
        team3.setBackgroundImage(#imageLiteral(resourceName: "brandbil"), for: .normal)
        team4.setBackgroundImage(#imageLiteral(resourceName: "brandman"), for: .normal)
        team5.setBackgroundImage(#imageLiteral(resourceName: "mario"), for: .normal)
        
        
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AddPlayerViewController {
            destination.number = teamID
            if let nrOfTeams = teamsSelected{
                destination.nrOfTeams = nrOfTeams
            }
        }
        
    }
    
    
    
}
