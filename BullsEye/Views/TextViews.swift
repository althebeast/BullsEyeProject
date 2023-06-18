//
//  TextViews.swift
//  BullsEye
//
//  Created by Alperen Sarışan on 13.06.2023.
//

import SwiftUI

struct InstructionText: View {
    
    var text:String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(5.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct TargetNumberText: View {
    
    var text:String
    
    var body: some View{
        Text(text)
            .kerning(-1.0)
            .fontWeight(.black)
            .font(.largeTitle)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderText: View{
    
    var text: String
    
    var body: some View{
        Text(text)
            .font(.title3)
            .bold()
            .foregroundColor(Color("TextColor"))
    }
}

struct LabelText: View{
    var text: String
    
    var body: some View{
        Text(text.uppercased())
            .font(.footnote)
            .kerning(1.5)
            .bold()
            .foregroundColor(Color("TextColor"))
    }
}

struct BodyText: View{
    var text: String
    
    var body: some View{
        Text(text)
            .font(.subheadline)
            .bold()
            .multilineTextAlignment(.center)
            .kerning(1)
            .lineSpacing(12)
    }
}

struct ButtonText: View{
    var text: String
    
    var body: some View{
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color.accentColor
            )
            .foregroundColor(Color.white)
            .cornerRadius(15)
    }
}

struct RoundedTextView: View{
    var text: String
    
    var body: some View{
        Text(text)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
            Circle()
                .strokeBorder(lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct ScoreText: View{
    var score: Int
    
    var body: some View{
        Text(String(score))
            .font(.title2)
            .bold()
    }
}

struct DateText: View{
    var date: Date
    
    var body: some View{
        Text(date, style: .time)
            .font(.title2)
            .bold()
    }
}

struct BigBoldText: View{
    let text: String
    
    var body: some View{
        Text(text.uppercased())
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
            .font(.title)
            .fontWeight(.black)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            InstructionText(text: "Instructions")
            TargetNumberText(text: "50")
            SliderText(text: "1-100")
            LabelText(text: "Score")
            BodyText(text: "You scored 200 points\n🏅🏅🏅")
            ButtonText(text: "Start New Round")
            RoundedTextView(text: "1")
            ScoreText(score: 10)
            DateText(date: Date())
            BigBoldText(text: "Leaderboard")
        }
        .padding()
    }
}
