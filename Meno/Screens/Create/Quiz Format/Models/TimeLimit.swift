//
//  TimeLimit.swift
//  Meno
//
//  Created by Saba Gogrichiani on 18.05.25.
//


enum TimeLimit: String, CaseIterable, Identifiable {
    case tenSeconds = "10 seconds"
    case thirtySeconds = "30 seconds"
    case unlimited = "Unlimited"
    
    var id: String { self.rawValue }
    
    var seconds: Int? {
        switch self {
        case .tenSeconds:
            return 10
        case .thirtySeconds:
            return 30
        case .unlimited:
            return nil
        }
    }
}