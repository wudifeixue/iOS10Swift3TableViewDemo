//
//  TableViewController.swift
//  iOS10Swift3TableViewDemo
//
//  Created by Avantech on 2016-10-17.
//  Copyright © 2016 wudifeixue. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var data = ["Banana", "Monkey", "Apple", "Cool."];
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "demoCell", for: indexPath);

        cell.textLabel?.text = data[indexPath.row];

        return cell;
    }
    
    @IBAction func addButton(_ sender: AnyObject) {
        let alert = UIAlertController(
            title: "Add New Object",
            message: "Enter Object's Name",
            preferredStyle: .alert)
        
        self.present(alert, animated: true, completion: nil); 
    }

}
