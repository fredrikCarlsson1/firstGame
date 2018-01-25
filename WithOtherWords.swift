//
//  with_other_words.swift
//  game
//
//  Created by Fredrik Carlsson on 2018-01-11.
//  Copyright © 2018 Fredrik Carlsson. All rights reserved.
//

import Foundation

public class withOtherWords {

    
    public var title = ""
    public var word1 = ""
    public var word2 = ""
    public var word3 = ""
    public var word4 = ""
    public var word5 = ""
    
    private var gameDescription = "OK, --- It´s your turn. After you press start, you got 45 seconds to describe five words that can be associated to the topic: ---. Make sure to hide the screen for your teammates"
    

    init(title: String, firstWord: String, secondWord: String, thirdWord: String, fourthWord: String, fifthWord: String) {
        self.title = title
        self.word1 = firstWord
        self.word2 = secondWord
        self.word3 = thirdWord
        self.word4 = fourthWord
        self.word5 = fifthWord
    }
 
}
