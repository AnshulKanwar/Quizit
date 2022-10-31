//
//  QuizManager.swift
//  Quizit
//
//  Created by Anshul Kanwar on 31/10/22.
//

import Foundation

enum QuizError: Error {
    case noQuestionsProvided
    case noOptionSelected
    case noMoreQuestions
}

class QuizManager {
    let questions: [Question]
    private(set) var currentQuestionIdx = 0
    private var selectedOption: UUID? = nil
    var score = 0
    
    init(questions: [Question]) {
// FIXME: add error handling
//        if questions.count == 0 {
//            throw QuizError.noQuestionsProvided
//        }
        self.questions = questions
    }
    
    var currentQuestion: Question {
        questions[currentQuestionIdx]
    }
    
    func selectOption(optionId: UUID) {
        selectedOption = optionId
    }
    
    private func submit() throws {
        guard selectedOption != nil else {
            throw QuizError.noOptionSelected
        }
        
        if selectedOption == currentQuestion.correctOption.id {
            score += 1
        }
    }
    
    func nextQuestion() throws {
        try submit()
        
        guard currentQuestionIdx + 1 < questions.count else {
            throw QuizError.noMoreQuestions
        }
        
        currentQuestionIdx += 1
    }
}
