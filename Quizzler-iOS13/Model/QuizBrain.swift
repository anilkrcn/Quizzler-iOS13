//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Anıl Karacan on 28.07.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], ca: "Skin"),
                Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], ca: "100"),
                Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], ca: "Greenwich Mean Time"),
                Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], ca: "Chapeau"),
                Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], ca: "Watch"),
                Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], ca: "Adiós"),
                Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], ca: "Orange"),
                Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], ca: "Rum"),
                Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], ca: "Gorilla"),
                Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], ca: "Australia")

]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool{
        if userAnswer == quiz[questionNumber].correctAnswer {
            score += 1
            return true
        }else{
            //User got it wrong
            return false
        }
        
    }
    
    func getQuestionText() -> String{
        return quiz[questionNumber].text
    }
    
    func getChoice1Text() -> String {
        return quiz[questionNumber].answer[0]
    }
    
    func getChoice2Text() -> String {
        return quiz[questionNumber].answer[1]
    }
    
    func getChoice3Text() -> String {
        return quiz[questionNumber].answer[2]
    }
    
    func getProgress() -> Float{
        return (Float(questionNumber + 1) / Float(quiz.count))
    }
    
    mutating func nextQuestion(){
        if(questionNumber + 1 < quiz.count){
            questionNumber += 1
        }
        else{
            questionNumber = 0
            score = 0
        }
    }
    
    func getScore() -> Int{
        return score
    }
}
