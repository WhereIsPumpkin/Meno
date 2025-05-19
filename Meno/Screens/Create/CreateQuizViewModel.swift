//
//  CreateQuizViewModel.swift
//  Meno
//
//  Created by Saba Gogrichiani on 15.05.25.
//

import Foundation

@Observable
final class CreateQuizViewModel {
    var previewText = ""
    var isPasteTextSelected = false
    
    func paste(text: String) {
        previewText = text
        isPasteTextSelected = true
    }
}
