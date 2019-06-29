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
    
    @IBOutlet weak var photoImageView: UIImageView!
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
  
    //Allows the user to select an image when the user taps on the screen
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        //hides the keyboard once the user has pressed the return button on the keyboard
        health_outlook.resignFirstResponder()
     
        //Creates a image picker controller
        let imagePickerController = UIImagePickerController()
        
        //ensures images can only be selected as needed
        //enum representation
        imagePickerController.sourceType = .photoLibrary
    
        //this allows the image to animate when selected by the user
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    //Is handled once the user taps on the image picker and dismissed the selection once the cancel button is pressed.
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        
        //closes the image picker
        dismiss(animated: true, completion: nil)
    }
    

    //Is handled once the user selects a image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // ensures the original representation of the image is used.
        
        //error catching has been added to prevent app from crashing if the worst case scenario does end up happening
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Sets selected image to show
        photoImageView.image = selectedImage
        
        //closes the image picker
        dismiss(animated: true, completion: nil)
    }
    
}

