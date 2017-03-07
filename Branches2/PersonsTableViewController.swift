//
//  PersonsTableViewController.swift
//  Branches2
//
//  Created by Ana Calvo on 5/3/17.
//  Copyright © 2017 Ana Calvo. All rights reserved.
//

import UIKit

class PersonsTableViewController: UITableViewController {

    let downloaderInstance = Downloader()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloaderInstance.downloadPersons()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return downloaderInstance.downloadedPersons.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        cell.textLabel?.text = downloaderInstance.downloadedPersons[indexPath.row].name

        return cell
    }
    
    
//    func refresh {
//        let persons = downloaderInstance.downloadedPersons
//        print(persons.count)
//    }

}

    
    
