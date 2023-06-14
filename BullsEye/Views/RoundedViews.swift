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
            .frame(width: 56, height: 56)
            .overlay(
            Circle()
                .strokeBorder(Color("ButtonStrokeColor"),lineWidth: 2.0)
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56, height: 56)
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
            .frame(width: 68, height: 55)
            .overlay(
                RoundedRectangle(cornerRadius: 21)
                .stroke(lineWidth: 2.0)
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
