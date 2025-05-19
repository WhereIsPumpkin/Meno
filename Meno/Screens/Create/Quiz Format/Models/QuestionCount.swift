//
//  QuestionCount.swift
//  Meno
//
//  Created by Saba Gogrichiani on 18.05.25.
//


enum QuestionCount: Int, CaseIterable, Identifiable {
    case five = 5
    case ten = 10
    case fifteen = 15
    case twenty = 20
    
    var id: Int { self.rawValue }
}