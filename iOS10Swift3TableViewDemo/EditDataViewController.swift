//
//  EditDataViewController.swift
//  iOS10Swift3TableViewDemo
//
//  Created by Avantech on 2016-10-19.
//  Copyright © 2016 wudifeixue. All rights reserved.
//

import UIKit

class EditDataViewController: UIViewController {
    
    var name = "";
    var lastName = "";

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("The name is \(name)");

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}