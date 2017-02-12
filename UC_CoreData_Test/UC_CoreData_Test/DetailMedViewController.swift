//
//  DetailMedViewController.swift
//  UC_CoreData_Test
//
//  Created by Katie Collins on 2/2/17.
//  Copyright © 2017 CollinsInnovation. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DetailMedViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    
    var medName: String! {
        didSet {
            navigationItem.title = medName
        }
    }
    
    var imageStore: ImageStore!
    
    var med: Medication!
    
    var medDose: Double?
    
    var medFreq: Int32?
    
    var appearance: String?
    
    //var medIndex: Int!
    
    @IBOutlet var doseTF: UITextField!
    @IBOutlet var freqTF: UITextField!
    @IBOutlet var appTF: UITextField!
    
    override func viewDidLoad() {
        self.doseTF.delegate = self
        self.appTF.delegate = self
        self.freqTF.delegate = self
        
        self.appearance = self.med.appearance
        self.medDose = self.med.dosage
        self.medFreq = self.med.dailyFreq
        
        self.appTF.text = self.appearance!
        self.doseTF.text = String(self.medDose!)
        self.freqTF.text = String(self.medFreq!)
        
        let key = med.imageKey
        
        if let imageToDisplay = imageStore.imageForKey(key: key!) {
            imageView.image = imageToDisplay
        }
    }
    
    @IBAction func saveMed(_ sender: Any) {
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(med)
        appDelegate.saveContext()
        
        let newMed = Medication(context: context)
        newMed.appearance = appTF.text!
        if let newFreq = Int32(freqTF.text!) {
            newMed.dailyFreq = newFreq
        } else {
            newMed.dailyFreq = 0
        }
        if let newDose = Double(doseTF.text!) {
            newMed.dosage = newDose
        } else {
            newMed.dosage = 0.0
        }
        newMed.name = medName
        appDelegate.saveContext()
        med = newMed
        print(med)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == doseTF {
            doseTF.resignFirstResponder()
        }
        else if textField == freqTF {
            freqTF.resignFirstResponder()
        }
        else if textField == appTF {
            appTF.resignFirstResponder()
        }
        return true
    }
    
    @IBAction func takePicture(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        
        print("made image picker")
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("going to camera")
            imagePicker.sourceType = .camera
        } else {
            print("going to photo library")
            imagePicker.sourceType = .photoLibrary
        }
        
        print("setting delegate")
        
        imagePicker.delegate = self
        
        print("about to present image picker")
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        print("in image picker")
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        print("took image")
        
        imageStore.setImage(image: image, forKey: med.imageKey!)
        
        print("setting image")
        
        imageView.image = image
        
        print("dismissing")
        
        dismiss(animated: true, completion: nil)
    }
    
}
