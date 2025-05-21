//
//  QuizCustomizationServices.swift
//  Meno
//
//  Created by Saba Gogrichiani on 19.05.25.
//

struct QuizCustomizationServices {
    let quizGenerator: QuizGenerationService
    
    init(
        quizGenerator: QuizGenerationService = QuizGenerationRemoveService()
    ) {
        self.quizGenerator = quizGenerator
    }
}
