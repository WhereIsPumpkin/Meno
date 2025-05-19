//
//  QuizView.swift
//  Meno
//
//  Created by Saba Gogrichiani on 18.05.25.
//

import SwiftUI

struct QuizView: View {
    var body: some View {
        ZStack {
            Color.backgroundElevated.ignoresSafeArea()
            
            contentView
        }
    }
    
    private var contentView: some View {
        VStack {
            quizBox
            
            Spacer()
            
            actionButtons
        }
    }
    
    private var quizBox: some View {
        QuizBox(alignment: .leading, spacing: 010) {
            questionNumber
            
            question
            
            VStack(spacing: 16) {
                answerBox("Elephant")
                answerBox("Dog")
                answerBox("Monkey")
                answerBox("Cat")
            }
            .padding(.top, 12)
        }
        .padding(.horizontal, 20)
    }
    
    private var questionNumber: some View {
        Text("Question 1")
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.white)
            .font(.system(size: 14, weight: .light))
    }
    
    private var question: some View {
        Text("Which of the following mammals have testicles located inside the body?")
            .foregroundStyle(.white)
            .multilineTextAlignment(.leading)
            .font(.system(size: 16, weight: .semibold))
    }
    
    private var answerOptions: some View {
        VStack {
            
        }
    }
    
    private func answerBox(_ answer: String) -> some View {
        ZStack {
            Text(answer)
                .frame(maxWidth: .infinity)
                .frame(height: 44)
                .foregroundStyle(.white)
                .font(.system(size: 14, weight: .regular))
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.white.opacity(0.26), lineWidth: 1)
        )
    }
    
    private var actionButtons: some View {
        HStack {
            skipButton
            continueButton
        }
        .padding(.horizontal, 20)
    }
    
    private var skipButton: some View {
        Button {
            print("Skip")
        } label: {
            Text("Skip")
                .frame(maxWidth: .infinity)
                .frame(height: 44)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.white.opacity(0.26), lineWidth: 1)
                )
               
        }

    }
    
    private var continueButton: some View {
        Button {
            print("Save & Next")
        } label: {
            Text("Save & Next")
                .frame(maxWidth: .infinity)
                .frame(height: 44)
                .foregroundStyle(.black)
                .background(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.white.opacity(0.26), lineWidth: 1)
                )
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }

    }
}

#Preview {
    QuizView()
}
