//
//  QuizFormat.swift
//  Meno
//
//  Created by Saba Gogrichiani on 19.05.25.
//

struct QuizFormat: Encodable, Equatable, Hashable {
    var text: String
    var quizType: QuizType
    var questionCount: Int
}
