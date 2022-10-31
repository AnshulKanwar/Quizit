//
//  QuestionView.swift
//  Quizit
//
//  Created by Anshul Kanwar on 31/10/22.
//

import SwiftUI

struct QuestionView: View {
    @State var selected: UUID? = nil
    
    let questionNumber: Int
    let question: Question
    
    var body: some View {
        VStack {
            Text("\(question.text)")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 60)
            
            // FIXME: Refactor, Use Grid
            VStack {
                ForEach(question.options) { option in
                    if option.id == selected {
                        Button(action: {
                            selected = option.id
                        }) {
                            Text("\(option.text)")
                                .frame(maxWidth: .infinity, maxHeight: 60)
                        }
                        .buttonStyle(.borderedProminent)
                    } else {
                        Button(action: {
                            selected = option.id
                        }) {
                            Text("\(option.text)")
                                .frame(maxWidth: .infinity, maxHeight: 60)
                        }
                        .buttonStyle(.bordered)
                        
                    }
                }
            }
            .padding(.bottom, 30)
            
            Text("Next Question")
                .padding()
                .frame(maxWidth: .infinity)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .padding()
        .navigationTitle("Question \(questionNumber)")
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(questionNumber: 1, question: Question.sampleQuestions[0])
    }
}
