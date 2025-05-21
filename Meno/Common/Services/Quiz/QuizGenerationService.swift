//
//  QuizGenerationService.swift
//  Meno
//
//  Created by Saba Gogrichiani on 19.05.25.
//

protocol QuizGenerationService {
    func generateQuiz(from format: QuizFormat) async throws -> QuizQuestions
}
