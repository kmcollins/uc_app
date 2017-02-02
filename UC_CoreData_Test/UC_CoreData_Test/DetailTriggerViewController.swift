//
//  DetailTriggerViewController.swift
//  UC_CoreData_Test
//
//  Created by Katie Collins on 1/31/17.
//  Copyright © 2017 CollinsInnovation. All rights reserved.
//

import Foundation
import UIKit

class DetailTriggerViewContoller: UIViewController {
    
    var triggerName: String! {
        didSet {
            navigationItem.title = triggerName
        }
    }
    
}
