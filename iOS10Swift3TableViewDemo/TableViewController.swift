//
//  TableViewController.swift
//  iOS10Swift3TableViewDemo
//
//  Created by Avantech on 2016-10-17.
//  Copyright © 2016 wudifeixue. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    var data = [Object]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData();
        
        //Add an Build in Edit Button on Navigation Controller Left
        navigationItem.rightBarButtonItem = editButtonItem;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    var filePath: String {
        let manager = FileManager.default;
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first;
        return url!.appendingPathComponent("Data").path;
    }
    
    private func loadData() {
        if let ourData = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Object] {
            data = ourData;
        }
    }
    
    private func saveData(object: Object) {
        data.append(object);
        
        NSKeyedArchiver.archiveRootObject(data, toFile: filePath);
    }
    
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
        
        cell.textLabel?.text = data[indexPath.row].Name;
        cell.detailTextLabel?.text = data[indexPath.row].LastName;
        
        //One of the cool way to display two lines even though it says you can display infinite.
        //cell.detailTextLabel?.numberOfLines = 0;
        //cell.detailTextLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            data.remove(at: indexPath.row);
            NSKeyedArchiver.archiveRootObject(data, toFile: filePath);
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "EditSegue", sender: nil);
    }
    
    
    
    //MARK: - Actions
    @IBAction func addButton(_ sender: AnyObject) {
        let alert = UIAlertController(
            title: "Add New Object",
            message: "Enter Object's Name",
            preferredStyle: .alert)
        
        //Cancel on top of Save due to iOS convention of putting Cancel button on the left
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let save = UIAlertAction(title: "Save", style: .default) { (alertAction: UIAlertAction) in
            
            let name = alert.textFields?[0].text!;
            let lastName = alert.textFields?[1].text!;
            
            let newObject = Object(name: name!, lastName: lastName!);
            //Should check if this is text
            
            self.saveData(object: newObject);
            //Refresh table to show append data
            self.myTableView.reloadData();
        }
        
        
        alert.addTextField(configurationHandler: nil);
        alert.addTextField(configurationHandler: nil);
        
        alert.addAction(cancel);
        alert.addAction(save);
        
        self.present(alert, animated: true, completion: nil);
    }
    
    //MARK: Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? EditDataViewController {
            destination.name = data[myTableView.indexPathForSelectedRow!.row].Name;
        }
    }
    
    
}
