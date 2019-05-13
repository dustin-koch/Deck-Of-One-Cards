//
//  Person.swift
//  DeckOfOneCard
//
//  Created by Dustin Koch on 5/13/19.
//  Copyright © 2019 Rabbit Hole Fashion. All rights reserved.
//

import Foundation


class Person: Codable {
    
    enum CodingKeys: String, CodingKey {
        case name
        case birthYear = "birth_year"
        case eyeColor = "eye_color"
        case hairColor = "hair_color"
    }
    
    let name: String
    let birthYear: String
    let eyeColor: String
    let hairColor: String
    
    init(name: String, birthYear: String, eyeColor: String, hairColor: String){
        self.name = name
        self.birthYear = birthYear
        self.eyeColor = eyeColor
        self.hairColor = hairColor
    }
}//END OF CLASS
