//
//  LocalDataBase.swift
//  game
//
//  Created by Fredrik Carlsson on 2018-01-11.
//  Copyright © 2018 Fredrik Carlsson. All rights reserved.
//

import Foundation

public class LocalDataBase {
  
    
    static var teamArray = [Team]()
    static var nrOfRounds = 4
    
    
    
    

    var withOtherWordsList = [withOtherWords]()
    var humTheSongList = [HumTheSong]()
    
    
    init() {
        self.withOtherWordsList.append(pits)
        self.withOtherWordsList.append(capitalCities)
        self.withOtherWordsList.append(beers)
        self.withOtherWordsList.append(fastFoodRestaurans)

     
    }


    
    
    // WithOtherWords
    
    var pits = withOtherWords(title: "Pitsburgh Penguins Players", firstWord: "Sidney Crosby", secondWord: "Evgeni Malkin", thirdWord: "Phil Kessel", fourthWord: "Matt Murray", fifthWord: "Patrik Hörnqvist")
    var capitalCities = withOtherWords(title: "Capitals in Europe", firstWord: "Madrid", secondWord: "Warzava", thirdWord: "Lisabon", fourthWord: "Sofia", fifthWord: "Bucarest")
    var beers = withOtherWords(title: "Beer Brands", firstWord: "Carlsberg", secondWord: "Heiniken", thirdWord: "Guiness", fourthWord: "Singha", fifthWord: "Red Label")
    var fastFoodRestaurans = withOtherWords(title: "Fast Food Restaurants", firstWord: "McDonalds", secondWord: "Burger King", thirdWord: "Subway", fourthWord: "KFC", fifthWord: "Pizza Hut")
    
    
    // Can you figure it out?
    
    // Hum The song challenge
    
    
    

    
    //
    public func getWithOtherWords (atIndex: Int) -> withOtherWords{
        return self.withOtherWordsList[atIndex]
        
    }
    
    public func getSortedTeams()->[Team]{
        return LocalDataBase.teamArray.sorted{ $0.points > $1.points }
        
    }
    
    
    
  
    


}










