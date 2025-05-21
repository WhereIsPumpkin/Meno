//
//  QuizCustomizationViewModel.swift
//  Meno
//
//  Created by Saba Gogrichiani on 18.05.25.
//

import Foundation

@Observable
final class QuizCustomizationViewModel {
    var selectedQuizType: QuizType
    var isTypeDescriptionVisible: Bool
    var questionCount: Int
    
    let services: QuizCustomizationServices
    
    init(
        selectedQuizType: QuizType = .multipleChoice,
        isTypeDescriptionVisible: Bool = false,
        questionCount: Int = 10,
        services: QuizCustomizationServices = QuizCustomizationServices()
    ) {
        self.selectedQuizType = selectedQuizType
        self.isTypeDescriptionVisible = isTypeDescriptionVisible
        self.questionCount = questionCount
        self.services = services
    }
    
    func toggleTypeDescription() {
        isTypeDescriptionVisible.toggle()
    }
    
    func selectQuizType(_ type: QuizType) {
        selectedQuizType = type
    }
    
    func generateQuiz() {
        let quizFormat = QuizFormat(
            text: "",
            quizType: .multipleChoice,
            questionCount: 3
        )
        
        Task {
            do {
                let x = try await services.quizGenerator.generateQuiz(from: quizFormat)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
