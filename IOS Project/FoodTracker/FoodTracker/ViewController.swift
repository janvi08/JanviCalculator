//
//  ViewController.swift
//  FoodTracker
//
//  Created by admin on 13/12/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {


    @IBOutlet weak var trackerDisplay: UILabel!
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var getFood: UITextField!
    
    @IBAction func UpdateMeal(_ sender: UIButton) {
        trackerDisplay.text=getFood.text
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
         guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        photoView.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }

    @IBAction func AddImageGesture(_ sender: UITapGestureRecognizer) {
        getFood.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .photoLibrary
        
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
}

