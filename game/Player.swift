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
        
    }
  
    public var name = ""
    public var games = 0
    public var wins = 0
    
    init(name: String){
        self.name = name
        self.games = 0
        self.wins = 0
    }
    
    public required init?(coder aDecoder: NSCoder) {
        if let nameObj = aDecoder.decodeObject(forKey: Keys.Name) as? String{
            self.name = nameObj
        }
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: Keys.Name)
    }
    
    public func getName()-> String{
        return self.name
    }
}
