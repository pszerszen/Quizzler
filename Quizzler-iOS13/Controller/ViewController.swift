//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    
    var quizBrain = QuizBrain();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let correct = quizBrain.checkAnswer(userAnswer: sender.currentTitle!)
        quizBrain.incrementQuestionNumber()
        
        markButtonWithColor(button: sender, correct: correct)
    }
    
    func markButtonWithColor(button: UIButton, correct: Bool) {
        button.backgroundColor = correct ? UIColor.green : UIColor.red
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        progressBar.progress = quizBrain.getCurrentProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getCurrentQuestion()
        
        let answers: [String] = quizBrain.getCurrentAnswers()
        let answerButtons: [UIButton] = [aButton, bButton, cButton]
        for (i, button) in answerButtons.enumerated() {
            button.setTitle(answers[i], for: UIControl.State.normal)
            button.backgroundColor = UIColor.clear
        }
    }

}

