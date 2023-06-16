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
        .background(
            RingsView()
        )
    }
}

struct TopView: View {
    @Binding var game: Game
    var body: some View {
        HStack{
            Button {
                game.restartGame()
            } label: {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            Button {
                return
            } label: {
                RoundedImageViewFilled(systemName: "list.dash")
            }

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

struct RingsView: View{
    @Environment(\.colorScheme) var colorScheme
    var body: some View{
        ZStack{
            Color("BColor")
                .ignoresSafeArea()
            ForEach(1..<6){ ring in
                let size = CGFloat(ring * 100)
//if de ki gibi önce condicion yazılıyor, soru işareti eğer bu condicion true ise anlamına geliyor, ? den sonra gelen değer condicion true ise kullanılan değer, : ise eğer condicion true değil ise anlamına geliyor, : den sonra ki değer eğer condicion false ise kullanılıyor.
                let opacity = colorScheme == .dark ? 0.7 : 0.3
                Circle()
                    .stroke(lineWidth: 10)
                    .fill(RadialGradient(gradient: Gradient(colors: [Color("RingsColor").opacity(opacity * 0.8), Color("RingsColor").opacity(0)]), center: .center, startRadius: 100, endRadius: 300))
                    .frame(width: size, height: size)
            }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
