//
//  Extensions.swift
//  EP3_PRACTICE
//
//  Created by Guillermo on 7/12/23.
//

import Foundation
import SwiftUI

extension TabView {
    func tab() -> some View {
        self.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)).frame(height: 350)
    }
}

extension VStack {
    func questionsContainer() -> some View {
        self.frame(width: 350, height: 350)
            .background(Color("WhiteSmoke"))
            .foregroundColor(.black)
            .padding(.horizontal, 20)
    }
}

extension Circle {
    func selected() -> some View {
        self.foregroundColor(Color("VintageRed"))
            .shadow(radius: 3)
            .frame(width: 24, height: 24)
    }
    
    func unselected() -> some View {
        self.stroke()
            .shadow(radius: 3)
            .frame(width: 24, height: 24)
    }
}

extension Image {
    func small() -> some View {
        self.resizable().scaledToFit().frame(width: 40)
    }
    
    func medium() -> some View {
        self.resizable().scaledToFit().frame(width: 80, height: 80)
    }
    
    func large() -> some View {
        self.resizable().scaledToFit().frame(width: 120, height: 120)
    }
    
    func footerImg() -> some View {
        self.resizable()
            .scaledToFit()
            .frame(width: 220, height: 80)
    }
    
    func headerImage() -> some View {
        self.resizable().scaledToFit().frame(width: 300, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

extension Text {
    func questionTitle() -> some View {
        self.bold()
            .frame(width: 320, height: 80)
            .padding(.horizontal, 10)
            .background(Color("VintageYellow"))
            .cornerRadius(8)
            .foregroundColor(.black)
    }
    
    func mainTitle() -> some View {
        self.bold()
            .underline()
            .padding(.vertical, 20)
            .font(.title)
            .foregroundColor(Color("DarkGray"))
    }
    
    func options() -> some View {
        self.font(.system(size: 16, weight: .semibold))
            .foregroundColor(Color("DarkGray"))
    }
    
    func textButton() -> some View {
        self.foregroundColor(Color("WhiteSmoke"))
            .padding()
            .frame(width: 273, height: 50)
            .background(Color("AccentColor"))
            .font(.title)
    }
    
    func resultText() -> some View {
        self.bold()
            .frame(width: 330, height: 120)
            .background(Color("resultColor"))
            .font(.title)
            .multilineTextAlignment(.center)
            .padding()
    }
    
    func endQuizText() -> some View {
        self.foregroundColor(.white)
            .bold()
            .frame(width: 300, height: 50)
            .background(Color("AccentColor"))
            .font(.title2)
            .padding()
    }
}
