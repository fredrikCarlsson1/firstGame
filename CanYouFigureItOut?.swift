//
//  CanYouFigureItOut?.swift
//  game
//
//  Created by Fredrik Carlsson on 2018-01-11.
//  Copyright © 2018 Fredrik Carlsson. All rights reserved.
//

import Foundation
public class CanYouFigureItOut {
    
    public var subject = ""
    public var answer = ""
    public var clue1 = ""
    public var clue2 = ""
    public var clue3 = ""
    public var clue4 = ""
    public var clue5 = ""
    
    init(title: String, answer: String, firstWord: String, secondWord: String, thirdWord: String, fourthWord: String, fifthWord: String) {
        self.subject = title
        self.answer = answer
        self.clue1 = firstWord
        self.clue2 = secondWord
        self.clue3 = thirdWord
        self.clue4 = fourthWord
        self.clue5 = fifthWord
    }
 
}
