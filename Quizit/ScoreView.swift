//
//  ScoreView.swift
//  Quizit
//
//  Created by Anshul Kanwar on 01/11/22.
//

import SwiftUI

struct ScoreView: View {
    let score: Int
    let tryAgainAction: () -> Void
    
    var percentage: Int {
        Int(Float(score) / 5 * 100)
    }
    
    var body: some View {
        VStack {
            Text("You scored \(percentage)%")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 30)
            
            Text("You correctly guessed \(score) out of 5")
                .font(.headline)
                .padding(.bottom, 60)
            
            Button(action: {
                tryAgainAction()
            }) {
                Text("Try again")
                    .frame(maxWidth: .infinity, maxHeight: 60)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .navigationTitle("Score")
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScoreView(score: 4, tryAgainAction: {})
        }
    }
}
