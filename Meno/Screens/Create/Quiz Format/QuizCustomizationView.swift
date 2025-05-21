//
//  QuizCustomizationView.swift
//  Meno
//
//  Created on 18.05.25.
//

import SwiftUI

struct QuizCustomizationView: View {
    // MARK: - Dependencies
    @Environment(AppViewModel.self) private var appViewModel
    @State private var viewModel = QuizCustomizationViewModel()
    
    // MARK: - Body
    var body: some View {
        ZStack {
            backgroundView
            
            contentContainer
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            toolbarTitleView
        }
    }
    
    // MARK: - Main Layout Components
    
    private var backgroundView: some View {
        Color.backgroundPrimary.ignoresSafeArea()
    }
    
    private var contentContainer: some View {
        VStack(alignment: .leading, spacing: 24) {
            quizTypeSelectionSection
            questionCountSection
            
            Spacer()
            
            actionButton
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 24)
    }
    
    private var toolbarTitleView: ToolbarItem<Void, some View> {
        ToolbarItem(placement: .principal) {
            Text("Quiz Format")
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .bold))
        }
    }
    
    // MARK: - View Properties
    private var quizTypeSelectionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            quizTypeSelectionHeader
            
            if viewModel.isTypeDescriptionVisible {
                quizTypeDescriptionCard
                    .transition(.opacity.combined(with: .move(edge: .top).combined(with: .scale(scale: 0.95, anchor: .top))))
            }
        }
    }
    
    private var quizTypeSelectionHeader: some View {
        HStack {
            sectionTitleLabel("Quiz Type")
            
            Spacer()
            
            HStack(spacing: 8) {
                quizTypeDropdownMenu
                infoToggleButton
            }
        }
    }
    
    private var quizTypeDropdownMenu: some View {
        Menu {
            ForEach(QuizType.allCases) { type in
                Button {
                    viewModel.selectQuizType(type)
                } label: {
                    Label(type.rawValue, systemImage: type.iconName)
                }
            }
        } label: {
            HStack(spacing: 4) {
                Image(systemName: viewModel.selectedQuizType.iconName)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(.white)
                
                Text(viewModel.selectedQuizType.rawValue)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.white)
                
                Image(systemName: "chevron.down")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(.white.opacity(0.6))
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(Color.surfaceTertiary)
            .cornerRadius(8)
        }
    }
    
    private var infoToggleButton: some View {
        Button {
            animateTypeDescriptionVisibility()
        } label: {
            Image(systemName: viewModel.isTypeDescriptionVisible ? "info.circle.fill" : "info.circle")
                .font(.system(size: 16))
                .foregroundStyle(.white.opacity(0.7))
                .frame(width: 32, height: 32)
                .background(Color.surfaceTertiary)
                .cornerRadius(8)
        }
    }
    
    private var quizTypeDescriptionCard: some View {
        HStack(alignment: .center, spacing: 12) {
            quizTypeIconBadge
            
            quizTypeInformationContent
            
            Spacer()
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.surfaceTertiary.opacity(0.7))
        )
    }
    
    private var quizTypeIconBadge: some View {
        Image(systemName: viewModel.selectedQuizType.iconName)
            .font(.system(size: 16))
            .foregroundStyle(Color.accentColor)
            .frame(width: 28, height: 28)
            .background(Color.surfaceSecondary)
            .cornerRadius(6)
    }
    
    private var quizTypeInformationContent: some View {
        Text(viewModel.selectedQuizType.description)
            .font(.system(size: 13))
            .foregroundStyle(.white.opacity(0.9))
            .fixedSize(horizontal: false, vertical: true)
    }
    
    private var questionCountSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            sectionTitleLabel("Question Count")
            buttons
        }
    }
    
    private var buttons: some View {
        HStack(spacing: 12) {
            ForEach([5, 10, 15, 20], id: \.self) { count in
                Button {
                    viewModel.questionCount = count
                } label: {
                    Text("\(count)")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundStyle(viewModel.questionCount == count ? .black : .white)
                        .frame(height: 36)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(viewModel.questionCount == count ? Color.accentColor : Color.surfaceTertiary)
                        )
                }
            }
        }
    }
    
    @ViewBuilder
    private var actionButton: some View {
        Button("Next") {
            viewModel.generateQuiz()
        }
        .buttonStyle(.primary)
    }
    
    // MARK: - Helper Views
    private func sectionTitleLabel(_ title: String) -> some View {
        Text(title)
            .font(.system(size: 16, weight: .semibold))
            .foregroundStyle(.white)
    }
    
    // MARK: - Helper Methods
    private func animateTypeDescriptionVisibility(_ visible: Bool? = nil) {
        withAnimation(.easeInOut(duration: 0.2)) {
            if let visible = visible {
                viewModel.isTypeDescriptionVisible = visible
            } else {
                viewModel.toggleTypeDescription()
            }
        }
    }
}
