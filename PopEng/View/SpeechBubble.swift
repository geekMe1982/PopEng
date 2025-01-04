//
//  SpeechBubble.swift
//  PopEng
//
//  Created by Adam Khalifa on 02.01.2025.
//

import SwiftUI

struct SpeechBubble: Shape {
    let cornerRadius: CGFloat
    let isBottom: Bool
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
        if(isBottom) {
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

#Preview {
    SpeechBubble(cornerRadius: 20, isBottom: true, pointLocation: 150)
        .foregroundColor(.purple)
        .frame(width: 300, height: 120)
        .padding()
}
