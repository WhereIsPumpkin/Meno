//
//  QuizCustomizationViewModel.swift
//  Meno
//
//  Created by Saba Gogrichiani on 18.05.25.
//

import Foundation

@Observable
final class QuizCustomizationViewModel {
    var selectedQuizType: QuizType = .multipleChoice
    var isTypeDescriptionVisible = false
    
    func toggleTypeDescription() {
        isTypeDescriptionVisible.toggle()
    }
    
    func selectQuizType(_ type: QuizType) {
        selectedQuizType = type
    }
    
    var questionCount: Int = 10
    
    func generateQuiz() {
        
    }
}
