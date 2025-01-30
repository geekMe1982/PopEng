//
//  CustomButton.swift
//  PopEng
//
//  Created by Adam Khalifa on 24.08.2024.
//

import SwiftUI

struct LoginButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
         configuration.label
             .padding()
             .background(Color(red: 0.0, green: 0.0, blue: 0.5))
             .foregroundStyle(.primary)
             .buttonStyle(.borderedProminent)
             .controlSize(.large)
             .frame(maxWidth: .infinity)
     }
}

//#Preview {
//    CustomButton(title: "title",
//                 BGColor: .blue, FGColor: .white) {
//        //action
//    }
//}
