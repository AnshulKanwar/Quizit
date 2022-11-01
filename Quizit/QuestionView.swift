//
//  QuestionView.swift
//  Quizit
//
//  Created by Anshul Kanwar on 31/10/22.
//

import SwiftUI

struct QuestionView: View {
    @State var selected: UUID? = nil
    
    let questionId: UUID
    let questionNumber: Int
    let questionText: String
    let options: [Option]
    let nextQuestionAction: (_: UUID) -> Void
    
    var body: some View {
        VStack {
            Text("\(questionText)")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 60)
            
            // FIXME: Refactor, Use Grid
            VStack {
                ForEach(options) { option in
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
            
            Button(action: { nextQuestionAction(selected!) }) {
                Text("Next Question")
                    .padding()
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationTitle("Question \(questionNumber)")
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(
            questionId: Question.sampleQuestions[0].id,
            questionNumber: 1,
            questionText: Question.sampleQuestions[0].text,
            options: Question.sampleQuestions[0].options,
            nextQuestionAction: { id in return}
        )
    }
}
