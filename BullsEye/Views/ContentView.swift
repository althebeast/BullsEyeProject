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
                InstructionsView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : 120)
                if alertIsVisible {
                    PointsView(game: $game, sliderValue: $sliderValue, alertIsVisible: $alertIsVisible)
                        .transition(.scale)
                } else {
                    HitMeButton(game: $game, sliderValue: $sliderValue, alertIsVisible: $alertIsVisible)
                        .transition(.scale)
                }
            }
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue)
                    .zIndex(1)
                    .transition(.scale)
                    .padding(.top, 10)
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
    }
}

struct HitMeButton: View{
    @Binding var game: Game
    @Binding var sliderValue: Double
    @Binding var alertIsVisible: Bool
    
    var body: some View{
        Button("Hit me".uppercased(),
               action: {
            withAnimation {
                alertIsVisible = true
            }
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
            RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
        )
        .cornerRadius(Constants.General.roundRectCornerRadius)
        .foregroundColor(Color.white)
        .bold()
        .font(.title3)
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
