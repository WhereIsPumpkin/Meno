//
//  HomeView.swift
//  Meno
//
//  Created by Saba Gogrichiani on 10.05.25.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties
    @Environment(AppViewModel.self) private var appViewModel
    @State var viewModel: HomeViewModel
    @State private var rotationAngle: Double = 0

    // MARK: - Initialization
    init(viewModel: HomeViewModel = HomeViewModel()) {
        self.viewModel = viewModel
    }

    // MARK: - Body
    var body: some View {
        ZStack {
            backgroundColor
            contentView
        }
        .toolbar {
            leadingToolbarItem
            centerToolbarItem
            trailingToolbarItem
        }
    }

    // MARK: - Toolbar Items
    private var leadingToolbarItem: ToolbarItem<Void, some View> {
        ToolbarItem(placement: .topBarLeading) {
            Image(.navBarLogo)
                .rotationEffect(.degrees(rotationAngle))
                .animation(.interpolatingSpring(stiffness: 170, damping: 10), value: rotationAngle)
                .onTapGesture {
                    rotationAngle += 360
                }
        }
    }

    private var centerToolbarItem: ToolbarItem<Void, some View> {
        ToolbarItem(placement: .principal) {
            Text("Meno")
                .foregroundStyle(.white)
                .font(.system(size: 28, weight: .bold))
        }
    }

    private var trailingToolbarItem: ToolbarItem<Void, some View> {
        ToolbarItem(placement: .topBarTrailing) {
            Circle()
                .fill(.backgroundPrimary)
                .frame(width: 36, height: 36)
                .overlay {
                    Image(systemName: "person")
                        .resizable()
                        .foregroundStyle(.white)
                        .frame(width: 16, height: 16)
                }
        }
    }

    // MARK: - View Components
    private var backgroundColor: some View {
        Color.backgroundElevated.ignoresSafeArea(.all)
    }

    private var contentView: some View {
        VStack {
            Text("Hello, World")
        }
    }
}
