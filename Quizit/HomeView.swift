//
//  ContentView.swift
//  Quizit
//
//  Created by Anshul Kanwar on 31/10/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var quizManager = QuizManager(questions: Question.sampleQuestions)
    
    @State var isLastQuestion = false
    
    func nextQuestionAction(selected: UUID) {
        quizManager.selectOption(optionId: selected)
        
        if quizManager.currentQuestionIdx < quizManager.questions.count - 1 {
            quizManager.nextQuestion()
        } else {
            quizManager.submit()
            isLastQuestion = true
        }
    }
    
    var body: some View {
        if !isLastQuestion {
            VStack {
                Text("Quizit")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                Text("The quiz will consist of 5 questions. Each question has 4 options out of which only one is correct")
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 40)
                
                NavigationLink(
                    destination:
                        QuestionView(
                            questionId: quizManager.currentQuestion.id,
                            questionNumber: quizManager.currentQuestionIdx + 1,
                            questionText: quizManager.questionText,
                            options: quizManager.options.shuffled(),
                            nextQuestionAction: nextQuestionAction
                        )
                ) {
                    Text("Take Quiz")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("Home")
        } else {
            ScoreView(score: quizManager.score, tryAgainAction: {
                quizManager.reset()
                isLastQuestion = false
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
