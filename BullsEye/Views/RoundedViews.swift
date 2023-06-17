//
//  RoundedViews.swift
//  BullsEye
//
//  Created by Alperen Sarışan on 13.06.2023.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
            Circle()
                .strokeBorder(Color("ButtonStrokeColor"),lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .background(
            Circle()
                .fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}

struct RoundRectTextView: View{
    var scoreRoundText: String
    
    var body: some View{
        Text(scoreRoundText)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
            .kerning(-0.2)
            .fontWeight(.bold)
            .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                .stroke(lineWidth: Constants.General.strokeWidth)
                .foregroundColor(Color("ButtonStrokeColor"))
            )
    }
}

struct PreviewView: View{
    var body: some View{
        VStack{
            RoundedImageViewFilled(systemName: "arrow.counterclockwise")
            RoundedImageViewStroked(systemName: "list.dash")
            RoundRectTextView(scoreRoundText: "999")
        }
    }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
    }
}
