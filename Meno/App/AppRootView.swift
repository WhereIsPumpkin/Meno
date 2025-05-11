//
//  AppRootView.swift
//  Meno
//
//  Created by Saba Gogrichiani on 10.05.25.
//

import SwiftUI

struct AppRootView: View {
    @State var appViewModel = AppViewModel()
    
    var body: some View {
        TabView(selection: $appViewModel.selectedTab) {
            NavigationStack(path: $appViewModel.homePath) {
                HomeView()
            }
            .tabItem { Label("Home", systemImage: "house") }
            .tag(AppViewModel.Tab.home)
            
            NavigationStack {
                EmptyView()
            }
            .tabItem { Label("Create", systemImage: "plus") }
            .tag(AppViewModel.Tab.create)
        }
        .sheet(isPresented: $appViewModel.showCreateSheet) {
            NavigationStack(path: $appViewModel.createQuizPath) {
                CreateQuizView()
                    .presentationDetents([.medium])
                    .presentationCornerRadius(20)
                    .presentationDragIndicator(.visible)
            }
        }
        .environment(appViewModel)
    }
}
