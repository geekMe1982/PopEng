//
//  OnBoardingView.swift
//  PopEng
//
//  Created by Adam Khalifa on 05.11.2024.
//

import SwiftUI

struct OnBoardingView: View {
    @State private var isFirstViewPresented = true
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30.0)
                            .foregroundColor(Color.purple)
                            .bold()
                    }.padding()
                    Spacer()
                }
                ZStack {
                    SpeechBubble(cornerRadius: 20, isButtom: true, pointLocation: 50)
                        .padding()
                        .frame(height: 150)
                    Text(isFirstViewPresented ?
                         Texts.onBoardingText1 :
                            Texts.onBoardingText2
                    )
                    .foregroundColor(Color.purple)
                    .font(.system(size: 20).bold())
                }
                Image(Images.OnBoard1)
                    .resizable()
                    .scaledToFit()
                    .offset(x:-20, y: -30)
                    .padding()
                Button("Continue", action: {
                    isFirstViewPresented = false
                })
                    .font(.system(size: 18.0))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 100.0, bottom: 16, trailing: 100.0))
                    .background(Color.purple)
                    .cornerRadius(10.0)
            }.padding()
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    OnBoardingView()
}

struct SpeechBubble: Shape {
    let cornerRadius: CGFloat
    let isButtom: Bool
    let pointLocation: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX+cornerRadius, y: rect.minY))
        //top left corner
        path.addArc(center: CGPoint(x: rect.minX+cornerRadius, y: rect.minY+cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: -180), clockwise: true)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY-cornerRadius))
        //bottom left
        path.addArc(center: CGPoint(x: rect.minX+cornerRadius, y: rect.maxY-cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 90), clockwise: true)
        //tip
        if(isButtom) {
            path.addLine(to: CGPoint(x: pointLocation-10, y: rect.maxY))
            path.addLine(to: CGPoint(x: pointLocation, y: rect.maxY+10))
            path.addLine(to: CGPoint(x: pointLocation+10, y: rect.maxY))
        }
        //buttom right
        path.addArc(center: CGPoint(x: rect.maxX-cornerRadius, y: rect.maxY-cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 0), clockwise: true)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY+cornerRadius))
        //top right
        path.addArc(center: CGPoint(x: rect.maxX-cornerRadius, y: rect.minY+cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: -90), clockwise: true)
        
        return path
    }
}
