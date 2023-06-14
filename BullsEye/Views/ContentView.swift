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
            BackgroundView(game: $game)
            VStack{
                Spacer()
                InstructionsView(game: $game)
                Spacer()
                SliderView(sliderValue: $sliderValue)
                Spacer()
                HitMeButton(game: $game, sliderValue: $sliderValue, alertIsVisible: $alertIsVisible)
                Spacer()
            }
        }
    }
}

struct InstructionsView: View{
    @Binding var game: Game
    
    var body: some View{
        VStack{
            InstructionText(text: "🎯🎯🎯 \n Put the Bulleye as close as you can to")
                .padding(.all, 30)
            TargetNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View{
    @Binding var sliderValue: Double
    
    var body: some View{
        HStack {
            SliderText(text: "1")
                .frame(width: 35)
            Slider(
                value: $sliderValue,
            in: 0...100)
            SliderText(text: "100")
                .frame(width: 35)
        }
        .padding()
    }
}

struct HitMeButton: View{
    @Binding var game: Game
    @Binding var sliderValue: Double
    @Binding var alertIsVisible: Bool
    
    var body: some View{
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
        .overlay(
            RoundedRectangle(cornerRadius: 21.0)
                .strokeBorder(Color.white, lineWidth: 2.0)
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
                sliderValue = 50
                game.target = Int.random(in: 1...100)
            })
        },
               message: {
            let roundedValue = Int(sliderValue.rounded())
            Text("""
                    The slider's value is \(roundedValue)
                    You scored \(game.points(sliderValue: roundedValue)) points this round.
                """)
        })
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
