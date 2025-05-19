//
//  QuizBox.swift
//  Meno
//
//  Created by Saba Gogrichiani on 18.05.25.
//

import SwiftUI

struct QuizBox<Content>: View where Content : View {
    
    let alignment: HorizontalAlignment
    let spacing: CGFloat
    let content: () -> Content
    
    init(
        alignment: HorizontalAlignment = .leading,
        spacing: CGFloat = 4,
        @ViewBuilder _ content: @escaping () -> Content
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: alignment, spacing: spacing) {
            content()
        }
        .frame(maxWidth: .infinity)
        .padding(20)
        .background(.backgroundPrimary)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    QuizBox {
        VStack(spacing: 12) {
            Text("Question 1")
                .font(.title)
                .bold()

            Text("What is the capital of France?")
                .font(.body)

            VStack(alignment: .leading, spacing: 8) {
                ForEach(["Paris", "London", "Berlin", "Madrid"], id: \.self) { answer in
                    Text(answer)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
    }
    .foregroundStyle(.white)
    .padding()
    .background(.backgroundElevated)
}
