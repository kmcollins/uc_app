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

class DetailMedViewController: UIViewController, UITextFieldDelegate {
    
    var medName: String! {
        didSet {
            navigationItem.title = medName
        }
    }
    
    var medDose: Double! {
        didSet {
            doseTF.text = String(medDose)
        }
    }
    
    var medFreq: Int32! {
        didSet {
            freqTF.text = String(medFreq)
        }
    }
    
    var appearance: String! {
        didSet {
            appTF.text = appearance
        }
    }
    
    var medIndex: Int!
    
    
    @IBOutlet var doseTF: UITextField!
    @IBOutlet var freqTF: UITextField!
    @IBOutlet var appTF: UITextField!
    
    override func viewDidLoad() {
        self.doseTF.delegate = self
        self.appTF.delegate = self
        self.freqTF.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == doseTF {
            saveDose(dose: textField.text!)
            doseTF.resignFirstResponder()
        }
        else if textField == freqTF {
            saveFreq(freq: textField.text!)
            freqTF.resignFirstResponder()
        }
        else if textField == appTF {
            saveAppearance(withDescription: textField.text!)
            appTF.resignFirstResponder()
        }
        return true
    }
    
    func saveDose(dose: String) {
        /*let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let medication =
        
        context.delete(medication)
        appDelegate.saveContext()*/
    }
    
    func saveFreq(freq: String) {
        
    }
    
    func saveAppearance(withDescription apprc: String) {
        
    }
    
}
