//
//  PersonsTableViewController.swift
//  Branches2
//
//  Created by Ana Calvo on 5/3/17.
//  Copyright © 2017 Ana Calvo. All rights reserved.
//

import UIKit

class PersonsTableViewController: UITableViewController {
    
    var persons: [Person]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        persons = downloadPersons()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return persons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.text = persons[indexPath.row]

        return cell
    }
 

// MARK: - Helper Methods
    
    struct Downloader {
        
        func downloadPersons() {
            
            let url = URL(string: "https://uinames.com/api/?amount=25")
            let request = URLRequest(url: url!)
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: request) { (data, response, error) in
                
                guard
                    let data = data,
                    let json = try? JSONSerialization.jsonObject(with: data, options:[]),
                    let personsArray = json as? [JSONDictionary] else { return }
                
                for person in personsArray  {
                    
                    if let person = Person(json: person) {
                        print(person.name)
                    }
                }
                
            }
            
            task.resume()
            
            
        }
        
    }
    
}
