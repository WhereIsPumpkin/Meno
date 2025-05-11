//
//  AppViewModel.swift
//  Meno
//
//  Created by Saba Gogrichiani on 11.05.25.
//

import SwiftUI

@Observable
final class AppViewModel {
    enum Tab {
        case home
        case create
    }
    
    var selectedTab: Tab = .home {
        didSet { presentCreateSheet() }
    }
    
    var homePath: [HomePath] = []
    var createQuizPath: [CreateQuizPath] = []
    var showCreateSheet: Bool = false
    // MARK: - Helper Methods
    
    private func presentCreateSheet() {
        if selectedTab == .create {
            showCreateSheet = true
            selectedTab = .home
        }
    }
}
