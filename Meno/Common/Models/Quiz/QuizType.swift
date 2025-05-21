//
//  QuizType.swift
//  Meno
//
//  Created by Saba Gogrichiani on 18.05.25.
//

enum QuizType: String, CaseIterable, Identifiable, Codable {
    case multipleChoice = "multipleChoice"
    case trueFalse = "True/False"
    case fillInTheBlank = "FillBlank"
    case matching = "Matching"
    case mixedMode = "MixedMode"
    
    var id: String { self.rawValue }
    
    var iconName: String {
        switch self {
        case .multipleChoice:
            return "list.bullet"
        case .trueFalse:
            return "checkmark.square"
        case .fillInTheBlank:
            return "text.insert"
        case .matching:
            return "arrow.left.and.right"
        case .mixedMode:
            return "shuffle"
        }
    }
    
    var description: String {
        switch self {
        case .multipleChoice:
            return "Standard format with 1 correct answer out of 4 options"
        case .trueFalse:
            return "Simplified binary choice for quick checks"
        case .fillInTheBlank:
            return "User fills in the missing key term or phrase"
        case .matching:
            return "Users match items (e.g., terms and definitions)"
        case .mixedMode:
            return "Automatically combines multiple quiz types for variety"
        }
    }
}
