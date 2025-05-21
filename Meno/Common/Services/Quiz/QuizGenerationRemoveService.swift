//
//  QuizGenerationRemoveService.swift
//  Meno
//
//  Created by Saba Gogrichiani on 19.05.25.
//

struct QuizGenerationRemoveService: QuizGenerationService {
    
    let network: Network
    
    init(network: Network = Network.shared) {
        self.network = network
    }
    
    func generateQuiz(from format: QuizFormat) async throws -> QuizQuestions {
        let dict = try format.toDictionary()
        
        return try await network.sendAPIRequest(
            host: "192.168.0.109",
            path: ServicePaths.generateQuiz,
            body: dict,
            method: .post,
            type: QuizQuestions.self
        )
    }
}

extension QuizGenerationRemoveService {
    enum ServicePaths {
        static var generateQuiz: String { "/quiz" }
    }
}
