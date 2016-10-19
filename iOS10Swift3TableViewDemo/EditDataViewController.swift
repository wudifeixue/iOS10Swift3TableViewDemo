//
//  EditDataViewController.swift
//  iOS10Swift3TableViewDemo
//
//  Created by Avantech on 2016-10-19.
//  Copyright © 2016 wudifeixue. All rights reserved.
//

import UIKit

class EditDataViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var data = [Object]();
    var path = "";
    var index = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow(_:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        
        
        nameTextField.text = data[index].Name;
        lastNameTextView.text = data[index].LastName;
        //checkValidInput();

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardDidShow(_ notification: Notification) {
        if let keyboardSize = ((notification as NSNotification).userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        {
            self.lastNameTextView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: lastNameTextView.frame.height - keyboardSize.height/2)
        }
    }
    
    func keyboardWillHide(_ notification: Notification) {
        if let keyboardSize = ((notification as NSNotification).userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.lastNameTextView.isEditable == true{
                self.lastNameTextView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: lastNameTextView.frame.height + keyboardSize.height/2)
                self.lastNameTextView.setContentOffset(CGPoint(x:0 , y:0), animated: false)
            }
        }
    }
    
//    func checkValidInput(){
//        // Disable the save button if the text field is empty.
//        let text = nameTextField.text ?? "";
//        saveButton.isEnabled = !text.isEmpty;
//    }
    
    @IBAction func saveDetail(_ sender: AnyObject) {
        if nameTextField.text != "" && lastNameTextView.text != "" {
            data[index].Name = nameTextField.text!;
            data[index].LastName = lastNameTextView.text!;
            
            NSKeyedArchiver.archiveRootObject(data, toFile: path);
            
            
            //dismiss(animated: true, completion: nil);
        }
    }
    
}
