//
//  DifficultyLevel.swift
//  Meno
//
//  Created by Saba Gogrichiani on 18.05.25.
//


enum DifficultyLevel: String, CaseIterable, Identifiable {
    case easy = "Easy"
    case medium = "Medium"
    case hard = "Hard"
    
    var id: String { self.rawValue }
}