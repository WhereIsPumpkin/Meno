//
//  CreateQuizViewModel.swift
//  Meno
//
//  Created by Saba Gogrichiani on 15.05.25.
//

import Foundation

@Observable
final class CreateQuizViewModel {
    var quizFormat: QuizFormat?
    var appViewModel: AppViewModel?
    var isPasteTextSelected = false
    
    func onAppear(_ appViewModel: AppViewModel) {
        self.appViewModel = appViewModel
    }
    
    func paste(text: String) {
        quizFormat?.text = text
        isPasteTextSelected = true
    }
    
    func onContinue() {
        appViewModel?.createQuizPath.append(.quizFormat)
    }
}
