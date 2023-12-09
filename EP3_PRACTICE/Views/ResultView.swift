//
//  ResultView.swift
//  EP3_PRACTICE
//
//  Created by Guillermo on 15/11/23.
//

import SwiftUI

struct ResultView: View {
    @Binding var result: Int
    @Environment(\.presentationMode) var dismiss
    
    @State var showSheet = false
        
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
                showSheet = true
            }, label: {
                Text("Ver puntajes")
            })
                
            Button(action: {
                dismiss.wrappedValue.dismiss()
                AppState.shared.quizID = UUID()
                    }){
                        Text("Comenzar de nuevo")
                            .textButton()
                        }
                     Spacer()
        }.sheet(isPresented: $showSheet) {
            RankingsView()
        }
            Image("isil")
                .padding()
        }
    }
