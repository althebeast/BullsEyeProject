//
//  PointsView.swift
//  BullsEye
//
//  Created by Alperen Sarışan on 17.06.2023.
//

import SwiftUI

struct PointsView: View {
    
    @Binding var game: Game
    @Binding var sliderValue: Double
    @Binding var alertIsVisible: Bool
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: roundedValue)
        VStack(spacing: 10){
            InstructionText(text: "The slider's value is".uppercased())
            TargetNumberText(text: String(roundedValue))
            BodyText(text: "You scored \(points) points\n🏅🏅🏅")
            Button {
                withAnimation {
                    alertIsVisible = false                    
                }
                game.startNewRound(points: points)
                sliderValue = 50.0
            } label: {
                ButtonText(text: "Start New Round")
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BColor"))
        .cornerRadius(21)
        .shadow(radius: 10, x: 5, y: 5)
    }
}

struct PointsView_Previews: PreviewProvider {
    static private var alertIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.0)
    static private var game = Binding.constant(Game())
    static var previews: some View {
        PointsView(game: game, sliderValue: sliderValue, alertIsVisible: alertIsVisible)
        PointsView(game: game, sliderValue: sliderValue, alertIsVisible: alertIsVisible)
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
