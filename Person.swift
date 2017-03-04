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
}


struct Downloader {

    func downloadJSON() {
        
        let url = URL(string: "https://uinames.com/api/?amount=25")
        let request = URLRequest(url: url!)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [JSONDictionary]
                print(json)
            }
        }
        
        task.resume()
    }

}
