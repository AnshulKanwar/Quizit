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

class QuizManager: ObservableObject {
    let questions: [Question]
    private(set) var currentQuestionIdx = 0
    private var selectedOption: UUID? = nil
    private(set) var score = 0
    
    @Published var questionText = ""
    @Published var options: [Option] = []
    
    init(questions: [Question]) {
// FIXME: add error handling
//        if questions.count == 0 {
//            throw QuizError.noQuestionsProvided
//        }
        self.questions = questions
        self.questionText = self.currentQuestion.text
        self.options = self.currentQuestion.options
    }
    
    func reset() {
        self.score = 0
        self.currentQuestionIdx = 0
        self.selectedOption = nil
    }
    
    var currentQuestion: Question {
        questions[currentQuestionIdx]
    }
    
    func selectOption(optionId: UUID) {
        selectedOption = optionId
    }
    
    func submit() {
        guard selectedOption != nil else {
//            throw QuizError.noOptionSelected
            return
        }
        
        if selectedOption == currentQuestion.correctOption.id {
            score += 1
        }
    }
    
    func nextQuestion() {
        submit()
        
        guard currentQuestionIdx + 1 < questions.count else {
            return
        }
        
        currentQuestionIdx += 1
        self.questionText = self.currentQuestion.text
        self.options = self.currentQuestion.options
    }
}
