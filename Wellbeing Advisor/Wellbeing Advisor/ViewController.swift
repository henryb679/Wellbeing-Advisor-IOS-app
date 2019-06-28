//
//  ViewController.swift
//  Wellbeing Advisor
//
//  Created by Henry Bai on 22/06/19.
//  Copyright © 2019 Henry Bai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var app_title: UILabel!
    @IBOutlet weak var health_outlook: UITextField!
    
    
    @IBOutlet weak var output_result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //handles UI text field by passing a valid text field delegate/
        //the self refers to the view controller class
        health_outlook.delegate = self
    }

    @IBAction func submit_button(_ sender: UIButton) {
        output_result.text = health_outlook.text
        
        //when submit button is pressed - the text box is cleared
        health_outlook.text = ""

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        //hides the keyboard once the user has pressed the return button on the keyboard
        health_outlook.resignFirstResponder()
        
        return true
    }
  
    
}

