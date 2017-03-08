//
//  PersonsTableViewController.swift
//  Branches2
//
//  Created by Ana Calvo on 5/3/17.
//  Copyright © 2017 Ana Calvo. All rights reserved.
//

import UIKit

class PersonsTableViewController: UITableViewController {
    
    var downloaderInstance: Downloader!
    // Aqui todavía no asignamos valor a la propiedad delegate de Downloader porque no nos deja usar self. Y esto es porque todavía no hay un init de la clase PersonsTableViewController. Por eso, no le asignamos valor a downloaderInstance hasta el viewDidLoad.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloaderInstance = Downloader(delegate: self)
        
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
    
    
    
    func refresh() {
        DispatchQueue.main.async {
            // Esto tiene que ver con multithreads. Los cambios en interfaz siempre tienen que estar hechos en el main thread. Es un concepto avanzado que veremos más adelante.
            self.tableView.reloadData()
        }
    }
    
    
}



