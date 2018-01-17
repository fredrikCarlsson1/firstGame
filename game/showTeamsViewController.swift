//
//  showTeamsViewController.swift
//  game
//
//  Created by Fredrik Carlsson on 2018-01-16.
//  Copyright © 2018 Fredrik Carlsson. All rights reserved.
//

import UIKit

class showTeamsViewController: UIViewController {
    @IBOutlet weak var buttonPressedView: UIView!
    
    @IBOutlet weak var scoreButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    
    
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
                self.restartButton.transform = .identity
                self.scoreButton.transform = .identity
                self.exitButton.transform = .identity
            }
        })
    }
    
    func closeMenu(){
        self.buttonPressedView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        self.restartButton.transform = CGAffineTransform(translationX: -11, y: 11)
        self.exitButton.transform = CGAffineTransform(translationX: 0, y: 15)
        self.scoreButton.transform = CGAffineTransform(translationX: -15, y: 0)
        
    }
    
    var teamID: Int?
    var i = 1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonPressedView.layer.cornerRadius = 150
        closeMenu()
        if let index = teamID {
            print(index)
            if let players = LocalDataBase.teamArray[index].players{
                for player in players {
                    let label = UILabel(frame: CGRect(x: 0, y: (100*(i)), width: 200, height: 21))
                    label.textAlignment = .center
                    label.text = player.name
                    self.view.addSubview(label)
                    i=i+1
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
