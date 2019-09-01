//
//  RecordAnEvent.swift
//  Wellbeing Advisor
//
//  Created by Henry Bai on 25/08/19.
//

import Foundation
import UIKit

class RecordAnEvent: UIViewController{


    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var eventOutput: UITextView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad();

        eventName.delegate = self
        eventOutput.text = "Output"
        eventOutput.textColor = UIColor.lightGray
        eventOutput.allowsEditingTextAttributes = false;

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }



    @IBAction func result(_ sender: Any) {
    
        eventOutput.text = "Event Name: \(eventName.text!)\n"
        eventOutput.textColor = UIColor.black;
    }
    

}

extension RecordAnEvent: UITextFieldDelegate{

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
