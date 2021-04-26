//
//  ViewController.swift
//  gesture_touches
//
//  Created by Aakash Jain on 12/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tapRecognizer: UITapGestureRecognizer!
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        print("onTap")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tapRecognizer.numberOfTapsRequired = 2
        
    }


}

