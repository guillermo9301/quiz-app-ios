//
//  QuestionModel.swift
//  EP3_PRACTICE
//
//  Created by Guillermo on 15/11/23.
//

import Foundation

struct Question: Decodable, Hashable {
    let id: String
    let title: String
    let answer: String
    let options: [String]
    var selection: String?
}

enum TYPEerror: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
    case decodingError
}

extension Data {
    func borarData(removeString word: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let borrarDataString = dataAsString?.replacingOccurrences(of: word, with: "")
        guard let data = borrarDataString?.data(using: .utf8) else {return nil}
        return data
    }
}



