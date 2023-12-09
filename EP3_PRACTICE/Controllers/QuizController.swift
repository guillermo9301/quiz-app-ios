//
//  QuizController.swift
//  EP3_PRACTICE
//
//  Created by Guillermo on 15/11/23.
//

import Foundation
import SwiftUI

class AppState: ObservableObject {
    static let shared = AppState()

    @Published var quizID = UUID()
}

class QuizManager: ObservableObject {
    
    init() {
        getListOfQuestions()
    }
            
    @Published var mockQuestions = [Question]()
    
    func getListOfQuestions() {
        NetworkManager.shared.getListOfQuestions { result in
            DispatchQueue.main.async {
                switch result {
                case.success(let mockQuestions):
                    print("ListQuestions: \(mockQuestions.count)")
                    self.mockQuestions = mockQuestions
                case.failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
          
    func canSubmitQuiz() -> Bool {
        return mockQuestions.filter({ $0.selection == nil }).isEmpty
    }
    
    func buttonColorChange() -> Color {
        let color: Color
        if mockQuestions.filter({ $0.selection == nil }).isEmpty == false {
            color = Color.gray
        } else {
            color = Color.blue
        }
        return color
    }
    
    func gradeQuiz() -> Int {
        var correct: Int = 0
        for question in mockQuestions {
            if question.answer == question.selection {
                correct += 1
            }
        }
        return (correct*2)
    }
    
        
}
