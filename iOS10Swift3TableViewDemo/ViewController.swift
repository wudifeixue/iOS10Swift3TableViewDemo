//
//  ViewController.swift
//  iOS10Swift3TableViewDemo
//
//  Created by Avantech on 2016-10-17.
//  Copyright © 2016 wudifeixue. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Stating how many sections are inside the TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    //Stating how many rows are inside each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    //Modifying the cell of the row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell();
        cell.textLabel?.text = "Something Cool";
        return cell;
    }

}

