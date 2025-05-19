//
//  CreateQuizLoaderViewModel.swift
//  Meno
//
//  Created by Saba Gogrichiani on 17.05.25.
//

import Foundation
import SwiftUI

@Observable
class CreateQuizLoaderViewModel {
    // MARK: - Properties
    var loadingProgress: Double = 0.0
    var loadingPhase: Int = 0
    var timer: Timer?

    let loadingMessages = [
        "Analyzing text...",
        "Extracting key concepts...",
        "Generating questions...",
        "Creating answer options...",
        "Finalizing your quiz...",
    ]

    // MARK: - Functions
    func startLoadingAnimation() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] timer in
            guard let self = self else { timer.invalidate(); return }

            if loadingProgress < 1 {
                loadingProgress += 0.01
            }
            
            updateLoadingPhase()
        }
    }
    
    func updateLoadingPhase() {
        let messageCount = loadingMessages.count
        print("Message Count is: \(messageCount)")
        
        let threshold = 1.0 / Double(messageCount)
        print("Threshold is: \(threshold)")
        
        let currentPhase = Int(loadingProgress / threshold)
        print("Current Phase is | LoadingProgress: \(loadingProgress) Threshold: \(threshold) \(currentPhase)")
        
        if currentPhase < messageCount && currentPhase != loadingPhase {
            withAnimation(.easeInOut(duration: 0.5)) {
                loadingPhase = currentPhase
            }
        }
    }

    deinit {
        timer?.invalidate()
        timer = nil
    }
}
