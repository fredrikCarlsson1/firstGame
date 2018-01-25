//
//  AddPlayerViewController.swift
//  game
//
//  Created by Fredrik Carlsson on 2018-01-13.
//  Copyright © 2018 Fredrik Carlsson. All rights reserved.
//

import UIKit


class AddPlayerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var number: Int?
    var nrOfTeams: Int?
    
    
    
    @IBOutlet weak var playerTableView: UITableView!
    @IBOutlet weak var addPlayerTextField: UITextField!
    @IBAction func saveButton(_ sender: UIButton) {
            performSegue(withIdentifier: "saveSelectedPlayersSegue", sender: self)
    }
    @IBAction func addPlayerButton(_ sender: UIButton) {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddPlayerViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        if (checkIfNameIsInArray() == true){
            createAlert(title: "Player already exists", message: "That player is already in the list, try another name")
            addPlayerTextField.text = ""
        }
        
        if (checkIfNameIsInArray() == false){
            if(addPlayerTextField.text != ""){
                if let player = addPlayerTextField.text{
                    let newPlayer = Player(name: player)
                    newPlayer.playerID = data.count
                    
                    self.saveData(player: newPlayer)
                    
                }
            }
            addPlayerTextField.text = ""
            
            playerTableView.reloadData()
        }
        
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    
    func checkIfNameIsInArray() -> Bool{
        for player in data{
            if (addPlayerTextField.text?.lowercased() == player.name.lowercased()){
                return true
            }
        }
        return false
    }
    
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(ACTION) in alert.dismiss(animated: true, completion: nil)
            
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->  UITableViewCell{
        
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "basicCell")
        cell.textLabel?.text = data[indexPath.row].name
        
        if let teamID = number{
            
                for player1 in LocalDataBase.teamArray[teamID-1].players {
                    if(data[indexPath.row].playerID == player1.playerID){
                        cell.accessoryType = UITableViewCellAccessoryType.checkmark
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = indexPath.row
        if let teamID = number {
            
            if(teamID>0){
                if (tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark) {
                    let player = data[indexPath.row]
                    LocalDataBase.teamArray[teamID-1].removePlayerFromTeam(playerID: player.playerID!)
                    
                    tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
                }
                else{
                    let player = data[indexPath.row]
                    LocalDataBase.teamArray[teamID-1].addPlayerToTeam(player: player)
                    
                    tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
                }
            }
            
        }
        
        if (number == nil){
            performSegue(withIdentifier: "showPlayers", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PlayerViewController {
            destination.player = data[(playerTableView.indexPathForSelectedRow?.row)!]
        }
        if let destination = segue.destination as? NewGameViewController {
            if let nr = nrOfTeams{
                destination.teamsSelected = nr
            }
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if(editingStyle == UITableViewCellEditingStyle.delete){
            data.remove(at: indexPath.row)
            NSKeyedArchiver.archiveRootObject(data, toFile: filePath)
            playerTableView.reloadData()
            
        }
    }
    
    var data = [Player]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        playerTableView.reloadData()
        if let teamID = number{
            for player in (LocalDataBase.teamArray[teamID-1].players){
                print(player.name)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
 
        if let teams = nrOfTeams{
            nrOfTeams = teams
        }
        loadData()

    }
    
    var filePath: String {
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        return url!.appendingPathComponent("Data").path
    }
    
    private func loadData(){
        if let ourData = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Player]{
            data = ourData
        }
    }
    
    private func saveData(player: Player){
        data.append(player)
        NSKeyedArchiver.archiveRootObject(data, toFile: filePath)
        
    }
    
   
    
    
    
    
    
    
}
