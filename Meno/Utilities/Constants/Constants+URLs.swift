//
//  Constants+URLs.swift
//  Meno
//
//  Created by Saba Gogrichiani on 19.05.25.
//

extension Constants {
    static let currentEnvironment: AppEnvironment = .development

    static var apiURL: String {
        switch currentEnvironment {
        case .development:
            return "localhost"
        case .production:
            return ""
        }
    }
    
    static var apiPort: Int? {
        switch currentEnvironment {
        case .development:
            return 3000
        case .production:
            return nil
        }
    }
}

enum AppEnvironment {
    case development
    case production
}
