//
//  Person.swift
//  Branches2
//
//  Created by Ana Calvo on 4/3/17.
//  Copyright © 2017 Ana Calvo. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String: Any]

struct Person {
    let name: String
    let surname: String
    let gender: String
    let region: String
    
    init?(json: JSONDictionary) {
        
        guard
            let name = json["name"] as? String,
            let surname = json["surname"] as? String,
            let gender = json["gender"] as? String,
            let region = json["region"] as? String
            else {fatalError("Something is going wrong")}
        
        self.name = name
        self.surname = surname
        self.gender = gender
        self.region = region
        
    }
}


