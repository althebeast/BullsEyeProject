//
//  BackgroundView.swift
//  BullsEye
//
//  Created by Alperen Sarışan on 13.06.2023.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    var body: some View {
        VStack{
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(Color("BColor")
            .ignoresSafeArea())
    }
}

struct TopView: View {
    @Binding var game: Game
    var body: some View {
        HStack{
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
        }
    }
}

struct NumberView: View{
    var title: String
    var text: String
    
    var body: some View {
        VStack{
            LabelText(text: title)
            RoundRectTextView(scoreRoundText: text)
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    var body: some View {
        HStack{
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
