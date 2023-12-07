//
//  ProgressBarView.swift
//  EP3_PRACTICE
//
//  Created by alumno on 15/11/23.
//

import SwiftUI

struct ProgressBarView: View {
    @Binding var progress: Float
    @Binding var number: Int
    var body: some View {
        VStack (alignment: .trailing) {
            Text("Pregunta \(number) de 10")
                .bold()
                .foregroundColor(.blue)
            
            ProgressView(value: progress){
                
            }.progressViewStyle(LinearProgressViewStyle(tint: Color("VintageRed")))
                .scaleEffect(x: 1.0, y: 3.0)
        }.background(Color("WhiteSmoke"))
    }
}


