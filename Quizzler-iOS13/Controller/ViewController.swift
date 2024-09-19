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
    
    @IBOutlet weak var choice1: UIButton!
    
    @IBOutlet weak var choice2: UIButton!
    
    @IBOutlet weak var choice3: UIButton!
    
    
    var quizBrain = QuizBrain()
    
    
    // var progressLevel = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //progressBar.progress = 0.0
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        /*if(progressLevel <= quiz.count){
            progressBar.progress = Float(progressLevel)/Float(quiz.count)
            progressLevel += 1
        }else{
            progressBar.progress = 0.0
            progressLevel = 1
        }*/
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }

    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        
        choice1.setTitle("\(quizBrain.getChoice1Text())", for: UIControl.State.normal)
        choice2.setTitle("\(quizBrain.getChoice2Text())", for: UIControl.State.normal)
        choice3.setTitle("\(quizBrain.getChoice3Text())", for: UIControl.State.normal)
        
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
        scoreLabel.text = "Score \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()
    }
}

