//
//  PrimaryButton.swift
//  Meno
//
//  Created by Saba Gogrichiani on 15.05.25.
//

import SwiftUI

struct PrimaryButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 12)
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .background(.white)
            .foregroundStyle(.backgroundElevated)
            .font(.system(size: 16, weight: .bold))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0) // squish on press
            .opacity(configuration.isPressed ? 0.85 : 1.0)     // dim a bit
            .animation(.spring(response: 0.3, dampingFraction: 0.5), value: configuration.isPressed)
    }
}

extension ButtonStyle where Self == PrimaryButton {
    static var primary: PrimaryButton { PrimaryButton() }
}
