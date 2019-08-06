//
//  ViewController.swift
//  Quiz
//
//  Created by ssoeuser on 21/6/19.
//  Copyright © 2019 Prakhar. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    let arrayQuestions = [question(questionLbl: "Where did Voldemort did his Education?", answer1: "Ngee Ann Secondary School", answer2: "Ivermorny School Of WitchCraft", answer3: "Hogwarts School Of Witchcraft and Wizardry", correctAnswerIndex: 2)
        ,question(questionLbl: "What is the name of the train station Harry boards?", answer1: "Station 9 and 3 quarters", answer2: "Bartley Station", answer3: "Punggol Station", correctAnswerIndex: 0),
         question(questionLbl: "What is the name of the shortest teacher in Hogwarts?", answer1: "Professor McGonagall", answer2: "Professor Dumbledore", answer3: "Professor Flitwick", correctAnswerIndex: 2)]

    @IBOutlet var sgrMainCtrlr: UISwipeGestureRecognizer!
    @IBOutlet var tgr: UITapGestureRecognizer!
    @IBOutlet weak var qnNoLabel: UILabel!
    @IBOutlet weak var qnLabel: UILabel!
    @IBOutlet weak var option1Label: UIButton!
    @IBOutlet weak var option2Label: UIButton!
    @IBOutlet weak var option3Label: UIButton!
    @IBOutlet weak var wrongLabel: UILabel!
    @IBOutlet weak var continueLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    
    var qnNumber = 1
    var index = 0
    
    fileprivate func setupCurrentQuestion() {
        qnNoLabel.text = "Qn \(index + 1)"
        tgr.isEnabled = false
        wrongLabel.isHidden = true
        continueLabel.isHidden = true
        correctLabel.isHidden = true
        qnLabel.text = arrayQuestions[index].questionLbl
        option1Label.setTitle(arrayQuestions[index].answer1, for: .normal)
        option2Label.setTitle(arrayQuestions[index].answer2, for: .normal)
        option3Label.setTitle(arrayQuestions[index].answer3, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCurrentQuestion()
        sgrMainCtrlr.isEnabled = false
    }
 
    @IBAction func button1Pressed(_ sender: Any) {
        if arrayQuestions[index].correctAnswerIndex == 0 {
            performSegue(withIdentifier: "correct", sender: nil)
            continueLabel.isHidden = false
            score += 1
            playSound()
        } else {
            wrongLabel.isHidden = false
            continueLabel.isHidden = false
            correctLabel.isHidden = false
            correctLabel.text = "The correct answer is option \(arrayQuestions[index].correctAnswerIndex + 1)"
        }
        if index == 3 {
            dismiss(animated: true, completion: nil)
        }
        index += 1
        qnNumber += 1
        tgr.isEnabled = true
        option1Label.isEnabled = false
        option2Label.isEnabled = false
        option3Label.isEnabled = false
    }
    
    @IBAction func button2Pressed(_ sender: Any) {
        if arrayQuestions[index].correctAnswerIndex == 1 {
            performSegue(withIdentifier: "correct", sender: nil)
            continueLabel.isHidden = false
            score += 1
            playSound()
        } else {
            wrongLabel.isHidden = false
            continueLabel.isHidden = false
            correctLabel.isHidden = false
            correctLabel.text = "The correct answer is option \(arrayQuestions[index].correctAnswerIndex + 1)"
        }
        if index == 3 {
            dismiss(animated: true, completion: nil)
        }
        index += 1
        qnNumber += 1
        tgr.isEnabled = true
        option1Label.isEnabled = false
        option2Label.isEnabled = false
        option3Label.isEnabled = false
    }
    
    @IBAction func button3Pressed(_ sender: Any) {
        if arrayQuestions[index].correctAnswerIndex == 2 {
            performSegue(withIdentifier: "correct", sender: nil)
            continueLabel.isHidden = false
            score += 1
            playSound()
            
        } else {
            wrongLabel.isHidden = false
            continueLabel.isHidden = false
            correctLabel.isHidden = false
            correctLabel.text = "The correct answer is option \(arrayQuestions[index].correctAnswerIndex + 1)"
        }
        if index == 3 {
            dismiss(animated: true, completion: nil)
        }
        index += 1
        qnNumber += 1
        tgr.isEnabled = true
        option1Label.isEnabled = false
        option2Label.isEnabled = false
        option3Label.isEnabled = false
    }
    @IBAction func tgrdone(_ sender: Any) {
        if index != 3 {
        setupCurrentQuestion()
        option1Label.isEnabled = true
        option2Label.isEnabled = true
        option3Label.isEnabled = true
        } else {
            performSegue(withIdentifier: "toExitScreen", sender: nil)
            sgrMainCtrlr.isEnabled = true
            continueLabel.text = "Swipe Down To Go to Home Screen"
            tgr.isEnabled = false
        }
        
    
}
    @IBAction func sgrMainCtrlrDone(_ sender: Any) {
        option1Label.isEnabled = true
        option2Label.isEnabled = true
        option3Label.isEnabled = true
        dismiss(animated: true, completion: nil)
    }
    
    var player: AVAudioPlayer?
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "Correct-answer", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

