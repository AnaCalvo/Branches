//
//  PersonsTableViewController.swift
//  Branches2
//
//  Created by Ana Calvo on 5/3/17.
//  Copyright © 2017 Ana Calvo. All rights reserved.
//

import UIKit

class PersonsTableViewController: UITableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let persons = Downloader()
        persons.downloadPersons()
        
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

        cell.textLabel?.text = persons.name[indexPath.row]

        return cell
    }

}

    
    
