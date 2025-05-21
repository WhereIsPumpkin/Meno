//
//  QuizType.swift
//  Meno
//
//  Created by Saba Gogrichiani on 19.05.25.
//

import Foundation

typealias QuizQuestions = [QuizQuestion]

struct QuizQuestion: Codable {
    let quizType: QuizType
    let questionNumber: Int?
    let questionText: String?
    let options: [String]?
    let correctAnswer: String?
    let explanation: String?
    
    func isCorrect(_ answer: String) -> Bool {
        answer.trimmingCharacters(in: .whitespacesAndNewlines)
              .caseInsensitiveCompare(correctAnswer ?? "") == .orderedSame
    }
}

