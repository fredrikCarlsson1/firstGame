//
//  HumTheSong.swift
//  game
//
//  Created by Fredrik Carlsson on 2018-01-11.
//  Copyright © 2018 Fredrik Carlsson. All rights reserved.
//

import Foundation

public class HumTheSong: NSObject, NSCoding {
        struct Keys{
            static let Title = "title"
            static let Word1 = "word1"
        }
        
        public var title = ""
        public var word1 = ""
        public var word2 = ""
        public var word3 = ""
        public var word4 = ""
        public var word5 = ""
        
        
        init(title: String, firstWord: String, secondWord: String, thirdWord: String, fourthWord: String, fifthWord: String) {
            self.title = title
            self.word1 = firstWord
            self.word2 = secondWord
            self.word3 = thirdWord
            self.word4 = fourthWord
            self.word5 = fifthWord
        }
        
        public required init(coder aDecoder: NSCoder) {
            if let titleObj = aDecoder.decodeObject(forKey: Keys.Title) as? String{
                self.title = titleObj
            }
            if let firstWord = aDecoder.decodeObject(forKey: Keys.Word1) as? String{
                self.word1 = firstWord
            }
        }
        
        public func encode(with aCoder: NSCoder) {
            aCoder.encode(self.title, forKey: Keys.Title)
            aCoder.encode(self.word1, forKey: Keys.Word1)
            
        }     
        
}
