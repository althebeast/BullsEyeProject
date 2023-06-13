//
//  ContentView.swift
//  BullsEye
//
//  Created by Alperen Sarışan on 24.05.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValue = 50.0
    @State private var alertIsVisible = false
    @State private var game = Game()
    
    var body: some View {
        ZStack{
            Color("BColor")
                .ignoresSafeArea()
            VStack{
                Spacer()
                InstructionText(text: "🎯🎯🎯 \n Put the Bulleye as close as you can to")
                    .padding(.horizontal, 30)
                Spacer()
                
                Spacer()
                HStack {
                    Text("1")
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color("TextColor"))
                    Slider(
                        value: $sliderValue,
                    in: 0...100)
                    Text("100")
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color("TextColor"))
                }
                .padding()
                Spacer()
                Button("Hit me".uppercased(),
                       action: {
                    alertIsVisible = true
                }).padding(20.0)
                .background(
                    ZStack {
                        Color("ButtonColor")
                        LinearGradient(
                            gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]),
                            startPoint: .top, endPoint: .bottom)
                    }
                )
                .cornerRadius(21.0)
                .foregroundColor(Color.white)
                .bold()
                .font(.title3)
                .alert("Hello There!",
                       isPresented: $alertIsVisible,
                       actions: {
                    Button("Awesome",
                           action: {
                        alertIsVisible = false
                        sliderValue = 50.0
                    })
                },
                       message: {
                    let roundedValue = Int(sliderValue.rounded())
                    Text("""
                            The slider's value is \(roundedValue)
                            You scored \(game.points(sliderValue: roundedValue)) points this round.
                        """)
                })
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
            .preferredColorScheme(.dark)
    }
}
