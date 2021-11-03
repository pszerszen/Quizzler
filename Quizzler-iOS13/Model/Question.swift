//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Piotr Szerszeń on 01/09/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let answer: String
    
    init(q text: String, a answer: String) {
        self.text = text
        self.answer = answer
        self.answers = []
    }
    
    init(q text: String, a answers: [String], correctAnswer answer: String) {
        self.text = text
        self.answers = answers
        self.answer = answer
    }

    func isCorrectAnswer(_ answer: String) -> Bool {
        return answer == self.answer
    }
}
