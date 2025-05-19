//
//  FocusArea.swift
//  Meno
//
//  Created by Saba Gogrichiani on 18.05.25.
//


enum FocusArea: String, CaseIterable, Identifiable {
    case definitions = "Definitions"
    case processes = "Processes"
    case people = "People/Names"
    case dates = "Dates"
    case concepts = "Concepts"
    
    var id: String { self.rawValue }
    
    var iconName: String {
        switch self {
        case .definitions:
            return "book"
        case .processes:
            return "flowchart"
        case .people:
            return "person.2"
        case .dates:
            return "calendar"
        case .concepts:
            return "lightbulb"
        }
    }
}