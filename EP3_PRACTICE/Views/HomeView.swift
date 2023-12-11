//
//  HomeView.swift
//  EP3_PRACTICE
//
//  Created by Guillermo on 9/12/23.
//

import SwiftUI

struct HomeView: View {
    @State var name = ""
    @State var showContent = false
    var body: some View {
        VStack {
            Image("logo_isil").headerImage()
            Text("Ingresa tu nombre para empezar").mainTitle()
            TextField("Nombre", text: $name)
                .frame(width: 250, height: 40)
                .background(Color("WhiteSmoke"))
                .foregroundColor(Color("VintageYellow"))
            Spacer()
            VStack {
                Button (action: {
                    showContent = true
                }, label: {
                    Text("Comenzar")
                }).fullScreenCover(isPresented: $showContent, content: {
                    ContentView(name: $name)
                })
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
