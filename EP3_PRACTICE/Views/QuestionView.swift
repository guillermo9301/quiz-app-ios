//
//  QuestionView.swift
//  EP3_PRACTICE
//
//  Created by Guillermo on 14/11/23.
//

import SwiftUI

struct QuestionView: View {
    @Binding var question: Question
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            Text(question.title).questionTitle()
                ForEach(question.options, id:\.self) { option in
                    HStack {
                        Button {
                            question.selection = option
                            print(option)
                        } label: {
                            if question.selection == option {
                                Circle().selected()
                            } else {
                                Circle().unselected()
                            }
                        }
                        Text(option).options()
                    }
                }
        }.questionsContainer()
    }
}
