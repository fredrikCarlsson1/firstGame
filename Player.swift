//
//  Player.swift
//  game
//
//  Created by Fredrik Carlsson on 2018-01-12.
//  Copyright © 2018 Fredrik Carlsson. All rights reserved.
//

import Foundation
public class Player: NSObject, NSCoding{

    struct Keys{
        static let Name = "name"
        static let Games = "games"
        static let Wins = "wins"
        static let PlayerID = "playerID"
        static let Team = "team"
        
    }
  
    public var name = ""
    public var games = 0
    public var wins = 0
    public var playerID: Int?
    public var team = 0
    
    init(name: String){
        self.name = name
        self.games = 0
        self.wins = 0
    }
    
    public required init?(coder aDecoder: NSCoder) {
        if let nameObj = aDecoder.decodeObject(forKey: Keys.Name) as? String{
            self.name = nameObj
        }
        if let gamesObj = aDecoder.decodeObject(forKey: Keys.Games) as? Int{
            self.games = gamesObj
        }
        if let winsObj = aDecoder.decodeObject(forKey: Keys.Wins) as? Int{
            self.wins = winsObj
        }
        if let idObj = aDecoder.decodeObject(forKey: Keys.PlayerID) as? Int{
            self.playerID = idObj
        }
        if let teamObj = aDecoder.decodeObject(forKey: Keys.Team) as? Int{
            self.team = teamObj
        }
        
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: Keys.Name)
        aCoder.encode(self.games, forKey: Keys.Games)
        aCoder.encode(self.wins, forKey: Keys.Wins)
        aCoder.encode(self.playerID, forKey: Keys.PlayerID)
        aCoder.encode(self.team, forKey: Keys.Team)
    }
    
//    public func getName()-> String{
//        return self.name
//    }
}
