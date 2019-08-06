//
//  questionCodeViewController.swift
//  Quiz
//
//  Created by ssoeuser on 21/6/19.
//  Copyright © 2019 Prakhar. All rights reserved.
//

import UIKit

class questionCodeViewController: UIViewController {

    @IBOutlet weak var harryPotterImage: UIImageView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var startQuizButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func starQuizButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "question", sender: nil)
    }
    

}
