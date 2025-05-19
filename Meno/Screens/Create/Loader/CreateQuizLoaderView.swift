//
//  CreateQuizLoaderView.swift
//  Meno
//
//  Created by Saba Gogrichiani on 15.05.25.
//

import SwiftUI
import DotLottie

struct CreateQuizLoaderView: View {
    // MARK: - Properties
    @Environment(AppViewModel.self) private var appViewModel
    @State private var viewModel = CreateQuizLoaderViewModel()
    
    // MARK: - Body
    var body: some View {
        ZStack {
            backgroundColor
            contentView
        }
        .onAppear {
            withAnimation {
                viewModel.startLoadingAnimation()
            }
        }
    }
    
    // MARK: - View Components
    private var backgroundColor: some View {
        Color.backgroundPrimary.ignoresSafeArea()
    }
    
    private var contentView: some View {
        VStack(spacing: 20) {
            animationView
            loaderInfoView
        }
        .padding(.bottom, 48)
    }
    
    private var animationView: some View {
        DotLottieAnimation(
            fileName: "LoadingAnimation",
            config: AnimationConfig(
                autoplay: true,
                loop: true
            )
        )
        .view()
        .frame(height: 200)
    }
    
    private var loaderInfoView: some View {
        VStack(spacing: 16) {
            currentPhaseMessage
            progressIndicator
            quizTipCard
        }
        .padding(.horizontal, 32)
    }
    
    private var currentPhaseMessage: some View {
        ZStack {
            Text(viewModel.loadingMessages[viewModel.loadingPhase])
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .id(viewModel.loadingPhase)
                .transition(.asymmetric(insertion: .scale, removal: .scale))
        }
        .animation(.easeInOut(duration: 0.5), value: viewModel.loadingPhase)
    }
     
    private var progressIndicator: some View {
        VStack(spacing: 8) {
            progressBar
            progressPercentage
        }
    }
    
    private var progressBar: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                progressBarBackground
                progressBarFill(width: geometry.size.width * viewModel.loadingProgress)
            }
        }
        .frame(height: 12)
    }
    
    private var progressBarBackground: some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(Color.surfaceTertiary)
            .frame(height: 12)
    }
    
    private func progressBarFill(width: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(Color.accentColor)
            .frame(width: width, height: 12)
            .animation(.easeInOut(duration: 0.5), value: viewModel.loadingProgress)
    }
    
    private var progressPercentage: some View {
        Text("\(Int(viewModel.loadingProgress * 100))%")
            .font(.system(size: 14, weight: .semibold))
            .foregroundStyle(.white.opacity(0.8))
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    private var quizTipCard: some View {
        VStack(spacing: 8) {
            tipTitle
            tipContent
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(Color.surfaceTertiary)
        .cornerRadius(12)
    }
    
    private var tipTitle: some View {
        Text("Did you know?")
            .font(.system(size: 16, weight: .semibold))
            .foregroundStyle(.white)
    }
    
    private var tipContent: some View {
        Text("Elephants Have Balls Inside")
            .font(.system(size: 14))
            .foregroundStyle(.white.opacity(0.7))
            .multilineTextAlignment(.center)
    }
}

#Preview {
    CreateQuizLoaderView()
        .environment(AppViewModel())
}
