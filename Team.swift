//
//  Team.swift
//  game
//
//  Created by Fredrik Carlsson on 2018-01-12.
//  Copyright © 2018 Fredrik Carlsson. All rights reserved.
//

import Foundation

public class Team {
    public var name = "NN"
    public var players:[Player] = []
    public var points = 0
    public var id: Int
    public var isUp: Bool
    public var x2Available = true
    public var switchTopic = true
    public var removePoints = true
    public var x2 = true
    public var switchBut = true
    public var remove = true
    
    
    init (name: String, points: Int, id: Int, isUp: Bool){
        self.name = name
        self.points = points
        self.id = id
        self.isUp = isUp
        
    }
    
    func addPlayerToTeam(player: Player){
        self.players.append(player)
    }
    
    func removePlayerFromTeam(playerID: Int){
        var i = 0
        for player in players{
            if (player.playerID == playerID){
            self.players.remove(at: i)
            break
            }
            i = i+1
        }
    }
    
    func addPoints(_ points: Int){
        self.points = self.points+points
    }
    
    
    
    
    
}
