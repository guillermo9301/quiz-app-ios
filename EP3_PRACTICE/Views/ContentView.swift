//
//  ContentView.swift
//  EP3_PRACTICE
//
//  Created by Guillermo on 14/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var manager = QuizManager()
    @State var result = ""
    @State var showResult = false
    
    @State var page = 0
    @State var number = 1
    @State var progress: Float = 0.10
    
    var body: some View {
            VStack {
                //TITULO
                TituloView()
                
                //PROGRESS BAR
                ProgressBarView(progress: $progress,number: $number).padding(.horizontal, 20)
                
                //TABVIEW CON PREGUNTAS
                TabView(selection: $page) {
                    //Con el ForEach se generan las paginas del TabView con cada pregunta y sus opciones
                    ForEach(manager.mockQuestions.indices, id: \.self) { index in
                        QuestionView(question: $manager.mockQuestions[index])
                    }
                }.tab()
                
                    HStack {
                        //boton back
                        Button {
                            //condicional para que no retroceda en la pregunta 1
                            if page > 0 || page == 9 {
                                withAnimation {
                                    page -= 1
                                }
                                //contador de preguntas y progreso para el ProgressView
                                number -= 1
                                progress -= 0.10
                            }
                        } label: {
                            Image("arrowBack").small()
                        }
                        Spacer()
                        //imagen
                        Image("quizImage").medium()
                        Spacer()
                        
                        //boton next
                        Button {
                            //condicional para que no se avance en la pregunta 10
                            if page >= 0 && page < 9 {
                                withAnimation {
                                    page += 1
                                }
                                //contador de preguntas y progerso para el ProgressView
                                number += 1
                                progress += 0.10
                            } else if page == 9 {
                                page = 9
                            }
                        } label: {
                            Image("arrowNext").small()
                        }
                    }.padding(.horizontal, 50)
                
                Spacer()
                Image("logo_isil").footerImg()
                
                    Button {
                        print(manager.canSubmitQuiz())
                        if manager.canSubmitQuiz() == true {
                            showResult = true
                            result = manager.gradeQuiz()
                        }
                    } label: {
                        Text("Terminar prueba")
                            .padding()
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 20, style: .continuous).fill(manager.buttonColorChange())
                                    .frame(width: 340).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            )
                    }.disabled(!manager.canSubmitQuiz())
            }
            .background(Color("WhiteSmoke").ignoresSafeArea())
            .fullScreenCover(isPresented: $showResult) {
                ResultView(result: $result)
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
