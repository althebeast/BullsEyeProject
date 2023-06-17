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

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            InstructionText(text: "Instructions")
            TargetNumberText(text: "50")
            SliderText(text: "1-100")
            LabelText(text: "Score")
            BodyText(text: "You scored 200 points\n🏅🏅🏅")
            ButtonText(text: "Start New Round")
        }
        .padding()
    }
}
