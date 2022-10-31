//
//  Question.swift
//  Quizit
//
//  Created by Anshul Kanwar on 31/10/22.
//

import Foundation

//FIXME: validation for a question to have exactly 4 options
struct Question {
    let id = UUID()
    let text: String
    let correctOption: Option
    let wrongOptions: [Option]
    
    var options: [Option] {
        var allOptions = wrongOptions
        allOptions.append(correctOption)
        
        return allOptions
    }
}

extension Question {
    static let sampleQuestions =
    [
        Question(
            text: "What is the capital of India?",
            correctOption: Option(text: "Delhi"),
            wrongOptions:
                [
                    Option(text: "Mumbai"),
                    Option(text: "Banglore"),
                    Option(text: "Chandigargh"),
                ]
        ),
        Question(
            text: "The ozone layer restricts",
            correctOption: Option(text: "Ultraviolet radiation"),
            wrongOptions:
                [
                    Option(text: "Visible light"),
                    Option(text: "Infrared radiation"),
                    Option(text: "X-rays and gamma rays"),
                ]
        )
    ]
}
