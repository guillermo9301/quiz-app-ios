//
//  ResultView.swift
//  EP3_PRACTICE
//
//  Created by Guillermo on 15/11/23.
//

import SwiftUI

struct ResultView: View {
    @Binding var result: String
    @Environment(\.presentationMode) var dismiss
        
    var body: some View {
        VStack {
            TituloView()
            
            Image("apple")
                .large()
                       
            Text("SWIFTUI")
                .bold()
                .padding()
                       
            Text("GRACIAS POR PARTICIPAR")
                .endQuizText()
                   
            Text("Su puntaje alcanzando es \(result)")
                .resultText()
                
            Button(action: {
                dismiss.wrappedValue.dismiss()
                AppState.shared.quizID = UUID()
                    }){
                        Text("Comenzar de nuevo")
                            .textButton()
                        }
                     Spacer()
                    }
            Image("isil")
                .padding()
        }
    }
