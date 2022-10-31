//
//  Option.swift
//  Quizit
//
//  Created by Anshul Kanwar on 31/10/22.
//

import Foundation

struct Option: Identifiable {
    let id: UUID
    let text: String
    
    init(id: UUID = UUID(), text: String) {
        self.id = id
        self.text = text
    }
}
