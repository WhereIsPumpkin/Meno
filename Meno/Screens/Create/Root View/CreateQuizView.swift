//
//  CreateQuizView.swift
//  Meno
//
//  Created by Saba Gogrichiani on 11.05.25.
//

import SwiftUI

struct CreateQuizView: View {
    
    @Environment(AppViewModel.self) private var appViewModel
    @State var viewModel: CreateQuizViewModel
    
    // MARK: - Initialization
    init(viewModel: CreateQuizViewModel = CreateQuizViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            backgroundColor
            contentView
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar { centerToolbarItem }
        .animation(.default, value: viewModel.isPasteTextSelected)
        .onAppear { viewModel.onAppear(appViewModel) }
        .navigationDestination(for: CreateQuizPath.self) { path in
            switch path {
            case .root:
                CreateQuizView()
            case .quizFormat:
                QuizCustomizationView()
            }
        }
    }
    
    private var backgroundColor: some View {
        Color.backgroundPrimary.ignoresSafeArea()
    }
    
    private var centerToolbarItem: ToolbarItem<Void, some View> {
        ToolbarItem(placement: .principal) {
            Text("Create Quiz")
                .foregroundStyle(.white)
                .font(.system(size: 20, weight: .bold))
        }
    }
    
    private var contentView: some View {
        VStack(alignment: .leading, spacing: 24) {
            pasteTextAction
            
            previewBox
            
            if !viewModel.isPasteTextSelected {
                Spacer()
            }
            
            actionButton
        }
        .padding(.horizontal, 20)
        .padding(.top, 4)
    }
    
    @ViewBuilder
    private var pasteTextAction: some View {
        if viewModel.isPasteTextSelected {
            activePasteTextAction
        } else {
            defaultPasteTextAction
        }
    }
    
    private var defaultPasteTextAction: some View {
        
        Button {
            guard let text = UIPasteboard.general.string else { return }
            viewModel.isPasteTextSelected.toggle()
            viewModel.paste(text: text)
        } label: {
            ActionCard(
                title: "Paste Text",
                description: "Generate a custom quiz from your own text",
                iconImage: Image(systemName: "clipboard"))
        }
    }
    
    private var activePasteTextAction: some View {
        Button {
            viewModel.isPasteTextSelected.toggle()
        } label: {
            ActionCard(
                state: .active,
                title: "Text Pasted Successfully",
                description: "Tap me to preview your text",
                iconImage: Image(systemName: "eye")
            )
        }
    }
    
    @ViewBuilder
    private var actionButton: some View {
        if viewModel.isPasteTextSelected {
            Button("Next") {
                viewModel.onContinue()
            }
            .buttonStyle(.primary)
        }
    }
    
    @ViewBuilder
    private var previewBox: some View {
        if viewModel.isPasteTextSelected {
            VStack(alignment: .leading, spacing: 12) {
                previewBoxTitle
                previewTextBox
            }
        }
    }
    
    private var previewBoxTitle: some View {
        Text("Preview")
            .foregroundStyle(.white)
            .font(.system(size: 18, weight: .medium))
    }
    
    private var previewTextBox: some View {
        CustomTextEditor(text: .constant(""))
            .frame(maxWidth: .infinity, minHeight: 120)
            .padding(.horizontal, 12)
            .padding(.top, 8)
            .background(.surfaceTertiary)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
