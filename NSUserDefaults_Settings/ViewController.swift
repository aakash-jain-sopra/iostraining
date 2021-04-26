//
//  ViewController.swift
//  NSUserDefaults_Settings
//
//  Created by Aakash Jain on 15/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateDateLabel()
        
        
    }
    
    func updateDateLabel() {
        let lastUpdateDate = UserDefaults.standard.object(forKey: "buttonTapped") as? NSDate
        
        if let hasSavedDate = lastUpdateDate {
            dateLabel.text = hasSavedDate.description
        } else {
            dateLabel.text = "No date saved."
        }
    }

    @IBAction func onDateBtnTap(_ sender: UIButton) {
        let now = NSDate()
        UserDefaults.standard.set(now, forKey: "buttonTapped");
        updateDateLabel()
    }
    
}

