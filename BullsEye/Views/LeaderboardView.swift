//
//  LeaderboardView.swift
//  BullsEye
//
//  Created by Alperen Sarışan on 18.06.2023.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var leaderboardIsShowing: Bool
    
    var body: some View {
        ZStack {
            Color("BColor").ignoresSafeArea()
            VStack(spacing: 10) {
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                LabelView()
                RowView(index: 1, score: 10, date: Date())
            }
        }
    }
}

struct HeaderView: View{
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Binding var leaderboardIsShowing: Bool
    
    var body: some View{
        ZStack {
            HStack {
                BigBoldText(text: "Leaderboard")
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    Spacer()
                }
            }
            HStack{
                Spacer()
                Button {
                    leaderboardIsShowing = false
                } label: {
                    RoundedImageViewFilled(systemName: "xmark")
                }

            }
        }
        .padding(.horizontal)
    }
}

struct LabelView: View{
    var body: some View{
        HStack{
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelText(text: "score")
                .frame(width: 60)
            Spacer()
            LabelText(text: "Date")
                .frame(width: 170)
        }
        .padding(.horizontal)
        .frame(maxWidth: 480)
    }
}

struct RowView: View{
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View{
        HStack{
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: 80)
            Spacer()
            DateText(date: date)
                .frame(width: 170)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(lineWidth: Constants.General.strokeWidth)
        )
        .padding(.horizontal)
        .frame(maxWidth: 480)
        }
    }

struct LeaderboardView_Previews: PreviewProvider {
    static private var leaderboardIsShowing = Binding.constant(false)
    static var previews: some View {
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing)
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing)
            .preferredColorScheme(.dark)
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing)
            .previewInterfaceOrientation(.landscapeRight)
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing)
            .previewInterfaceOrientation(.landscapeRight)
            .preferredColorScheme(.dark)
    }
}
