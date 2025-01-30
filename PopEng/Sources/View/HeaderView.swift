//
//  HeaderView.swift
//  PopEng
//
//  Created by Adam Khalifa on 21.08.2024.
//

import SwiftUI
import Lottie

struct HeaderView: View {
    var subtitle: String

    var body: some View {
        ZStack(){
            Rectangle()
                .fill(Color.mint)
                .rotationEffect(Angle(degrees: -40))
            Rectangle()
                .fill(Color.teal)
                .rotationEffect(Angle(degrees: -30))
            Rectangle()
                .fill(Color.indigo)
                .rotationEffect(Angle(degrees: -20))
            Rectangle()
                .fill(Color.brown)
                .rotationEffect(Angle(degrees: -10))
            Rectangle()
                .fill(Color.orange)
                .rotationEffect(Angle(degrees: 0))
            Rectangle()
            .fill(Color.blue)
            .rotationEffect(Angle(degrees: 10))
            Rectangle()
                .fill(Color.green)
                .rotationEffect(Angle(degrees: 20.0))
            Rectangle()
                .fill(Color.yellow)
                .rotationEffect(Angle(degrees: 30.0))
            Rectangle()
                .fill(Color.pink)
                .rotationEffect(Angle(degrees: 40))
            VStack {
                Image("POP")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding()
                    .background(.white)
                    .cornerRadius(50)
                    .shadow(color: .purple, radius: 5, x: 5, y: 5)
                Text(subtitle)
                    .font(.custom("Papyrus", size: 20))
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    HeaderView(subtitle: "subtitle")
}
