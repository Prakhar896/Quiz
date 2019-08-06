//
//  correctCodeViewController.swift
//  Quiz
//
//  Created by ssoeuser on 21/6/19.
//  Copyright © 2019 Prakhar. All rights reserved.
//

import UIKit

class correctCodeViewController: UIViewController {

    @IBOutlet var sgr: UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func sgrDone(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
