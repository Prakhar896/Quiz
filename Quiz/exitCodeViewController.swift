//
//  exitCodeViewController.swift
//  Quiz
//
//  Created by ssoeuser on 21/6/19.
//  Copyright © 2019 Prakhar. All rights reserved.
//

import UIKit

class exitCodeViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "\(score)/3"
        score = 0
    }
    
    @IBAction func exitButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
