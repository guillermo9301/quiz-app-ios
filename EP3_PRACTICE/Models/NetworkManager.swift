//
//  NetworkManager.swift
//  EP3_PRACTICE
//
//  Created by Guillermo on 6/12/23.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    static let url = "https://guillermo93.pythonanywhere.com/quiz-data"
    
    init() {}
    
    func getListOfQuestions(completed: @escaping (Result<[Question], TYPEerror>) -> Void) {
        guard let url = URL(string: NetworkManager.url)
        else {
            completed(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let data = data?.borarData(removeString: "null,") else {
                completed(.failure(.decodingError))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode([Question].self, from: data)
                completed(.success(decodedResponse))
            } catch {
                print("Debug error \(error.localizedDescription)")
                completed(.failure(.invalidResponse))
            }
        }.resume()
    }
}
