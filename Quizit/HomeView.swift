//
//  ContentView.swift
//  Quizit
//
//  Created by Anshul Kanwar on 31/10/22.
//

import SwiftUI

struct HomeView: View {
    
    let quizManager = QuizManager(questions: Question.sampleQuestions)
    
    var body: some View {
        VStack {
            Text("Quizit")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom)
            
            Text("The quiz will consist of 5 questions. Each question has 4 options out of which only one is correct")
                .multilineTextAlignment(.center)
                .padding(.bottom, 40)
            
            NavigationLink(destination: QuestionView(questionNumber: quizManager.currentQuestionIdx + 1, question: quizManager.currentQuestion)) {
                Text("Take Quiz")
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationTitle("Home")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
