//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Julio Conchas on 05/01/24.
//

import Foundation

struct QuizBrain
{
    let quiz = [
        Question(text: "Sharks are mammals.", answer: "False", explanation: "they are actually classified as fish."),
        Question(text: "Sea otters have a favorite rock they use to break open food.", answer: "True", explanation: "they keep these treasures in the loose skin under their arms."),
        Question(text: "The blue whale is the biggest animal to have ever lived.", answer: "True", explanation: "and that includes dinosaurs!"),
        Question(text: "The hummingbird egg is the world's smallest bird egg.", answer: "True", explanation: "on the flip side, ostriches lay the largest eggs."),
        Question(text: "Pigs roll in the mud because they don't like being clean.", answer: "False", explanation: "pigs have few sweat glands and their muddy baths help keep them cool."),
        Question(text: "Bats are blind.", answer: "False", explanation: "bats often find their way using ultrasound but their eyes work, just not particularly well"),
        Question(text: "A dog sweats by panting its tongue.", answer: "False", explanation: "canines sweat through glands in their paws."),
        Question(text: "It takes a sloth two weeks to digest a meal.", answer: "True", explanation: "that's the slowest digestion time of any mammal!"),
        Question(text: "The largest living frog is the Goliath frog of West Africa.", answer: "True", explanation: "this amphibian reaches lengths of 12.5 inches and weighs 7.2 pounds."),
        Question(text: "An ant can lift 1,000 times its body weight.", answer: "False", explanation: "ants can lift 5,000 times their body weight!"),
        Question(text: "When exiting a cave, bats always go in the direction of the wind.", answer: "False", explanation: "bats always turn left out of a cave."),
        Question(text: "Galapagos tortoises sleep up to 16 hours a day.", answer: "True", explanation: "and they can go a year without food or water, so they have lots of time for extra sleep."),
        Question(text: "An octopus has seven hearts.", answer: "False", explanation: "it has three hearts and they do a lot of work. One heart circulates blood around the body and the other two pump blood past the gills and pick up oxygen."),
        Question(text: "The goat is the national animal of Scotland.", answer: "False", explanation: "it is the unicorn."),
        Question(text: "Herbivores are animal eaters.", answer: "False", explanation: "herbivores only eat plants."),
        Question(text: "A monkey was the first non-human to go into space.", answer: "False", explanation: "fruit flies were the first to make the trip. ")
    ]
    var questionNumber = 0
    var score : Int = 0
    
    func getText() -> String
    {
        return quiz[questionNumber].text
    }
    func getProgress() -> Float
    {
        return Float(questionNumber) / Float(quiz.count)
    }
    mutating func checkAnswer(userAnswer : String) -> String
    {
        var answerForUser : String
        
        if quiz[questionNumber].answer == userAnswer
        {
            answerForUser = "RIGHT!\n"
            score += 1
        }
        else
        {
            answerForUser = "WRONG!\n"
        }
        return "\(answerForUser)Answer is \(quiz[questionNumber].answer)\n\(quiz[questionNumber].explanation)"
    }
    func nextQ() -> Bool
    {
        if self.questionNumber < quiz.count - 1
        {
            return true
        }
        else
        {
            return false
        }
    }
    func getScore() -> Int
    {
        return score
    }
}
