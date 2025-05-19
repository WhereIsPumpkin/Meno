//
//  ActionCard.swift
//  Meno
//
//  Created by Saba Gogrichiani on 15.05.25.
//

import SwiftUI

struct ActionCard: View {
    
    let state: ActionCardState
    let title: String
    let description: String
    let iconImage: Image

    init(
        state: ActionCardState = .default,
        title: String,
        description: String,
        iconImage: Image,
    ) {
        self.state = state
        self.title = title
        self.description = description
        self.iconImage = iconImage
    }
    
    var body: some View {
        HStack(spacing: 10) {
            icon
            text
            Spacer()
        }
        .padding(16)
        .frame(height: 66)
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(borderColor, lineWidth: 1)
        )
    }

    private var icon: some View {
        iconImage
            .resizable()
            .scaledToFit()
            .foregroundStyle(iconColor)
            .frame(width: 24, height: 24)
    }

    private var text: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(titleColor)

            Text(description)
                .font(.system(size: 12, weight: .medium))
                .foregroundStyle(descriptionColor)
        }
    }

    // MARK: - Styling Based on State
    private var backgroundColor: Color {
        switch state {
        case .default: return .clear
        case .active: return .surfaceSecondary
        }
    }

    private var borderColor: Color {
        switch state {
        case .default: return .white.opacity(0.26)
        case .active: return .clear
        }
    }

    private var iconColor: Color {
        switch state {
        case .default: return .white.opacity(0.4)
        case .active: return .surfacePrimary
        }
    }

    private var titleColor: Color {
        switch state {
        case .default: return .white
        case .active: return .surfacePrimary
        }
    }

    private var descriptionColor: Color {
        switch state {
        case .default: return .white.opacity(0.4)
        case .active: return .textTertiary.opacity(0.6)
        }
    }
}
