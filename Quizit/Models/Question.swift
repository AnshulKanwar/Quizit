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
        ),
        Question(
            text: "DRDL stands for",
            correctOption: Option(text: "Defence Research and Development Laboratary"),
            wrongOptions:
                [
                    Option(text: "Department of Research and Development Laboratory"),
                    Option(text: "Differential Research and Documentation Laboratary"),
                    Option(text: "None of the above"),
                ]
        ),
        Question(
            text: "'OS' computer abbreviation means",
            correctOption: Option(text: "Operating System"),
            wrongOptions:
                [
                    Option(text: "Order of Significance"),
                    Option(text: "Open Software"),
                    Option(text: "Optical Sensor"),
                ]
        ),
        Question(
            text: "Golden Temple is located in",
            correctOption: Option(text: "Amritsar"),
            wrongOptions:
                [
                    Option(text: "New Delhi"),
                    Option(text: "Agra"),
                    Option(text: "Mumbai"),
                ]
        ),
    ]
}
