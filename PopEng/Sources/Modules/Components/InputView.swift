//
//  SwiftUIView.swift
//  PopEng
//
//  Created by Adam Khalifa on 09.02.2025.
//

import SwiftUI

struct InputView: View {
    
    @Binding var text: String
    let title: String
    let placeHolder: String
    let mode: Mode
    @State private var isSecureField: Bool
    
    init(text: Binding<String>, title: String, placeHolder: String, mode: Mode = .normal) {
        self._text = text
        self.title = title
        self.placeHolder = placeHolder
        self.mode = mode
        self.isSecureField = mode.isSecure
    }
    enum Mode {
        var isSecure: Bool {
            switch self{
                
            case .secure:
                true
            case .normal:
                false
            }
        }
        case secure
        case normal
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            if isSecureField {
                SecureField(placeHolder, text: $text)
                    .font(.system(size: 14))
            }else{
                TextField(placeHolder, text: $text)
                    .font(.system(size: 14))
            }
            Divider()
        }
        .overlay(alignment: .trailing) {
            if mode.isSecure {
                Image(systemName: self.isSecureField ? "eye.slash" : "eye")
                    .accentColor(.gray)
                    .onTapGesture {
                        isSecureField.toggle()
                    }
            }
        }
    }
}

#Preview {
    InputView(text: .constant(""), title: "Email", placeHolder: "name@example.com", mode: .normal)
}
