//
//  ViewController.swift
//  Quizzler
//
//  Created by Julio Conchas on 03/01/24.
//

import UIKit

class ViewController: UIViewController {

    let QUESTION_INDEX = 0
    let QUESTION_ANSWER_INDEX = 1
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain  = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI(message: quizBrain.getText())
        progressBar.progress = 0
    }
    @IBAction func answerButtonPressed(_ sender: UIButton) 
    {
        trueButton.isEnabled = false
        falseButton.isEnabled = false
        
        questionText.text = quizBrain.checkAnswer(userAnswer: sender.titleLabel!.text!)
        
        if quizBrain.nextQ()
        {
            quizBrain.questionNumber += 1
            
            Timer.scheduledTimer(timeInterval: 7.0, target: self, selector: #selector(updateUiTimer), userInfo: nil, repeats: false)
        }
        else
        {
            updateUI(message: "That's it man, you rock!!")
            quizBrain.questionNumber = 0
            progressBar.progress = 0
            trueButton.isEnabled = true
            falseButton.isEnabled = true
        }
        let porcentageProgress = quizBrain.getProgress()
        progressBar.setProgress(porcentageProgress, animated: true)
    }
    func updateUI(message : String)
    {
        questionText.text = message
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
    }
    @objc func updateUiTimer()
    {
        questionText.text = quizBrain.getText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.isEnabled = true
        falseButton.isEnabled = true
    }

}

