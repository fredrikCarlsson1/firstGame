//
//  Team.swift
//  game
//
//  Created by Fredrik Carlsson on 2018-01-12.
//  Copyright © 2018 Fredrik Carlsson. All rights reserved.
//

import Foundation

 public class Team {
    public var players:[Player]? = []
    public var points = 0
    public var id: Int
    public var isUp: Bool
   
    
    init ( players: [Player]?, points: Int, id: Int, isUp: Bool){
        
        self.players = players
        self.points = points
        self.id = id
        self.isUp = isUp
        
    }
    
    func addPlayerToTeam(player: Player){
        self.players?.append(player)
    }
    
    
   
    
    
}
