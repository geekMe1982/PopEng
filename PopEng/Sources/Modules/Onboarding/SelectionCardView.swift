//
//  SelectionCardView.swift
//  PopEng
//
//  Created by Adam Khalifa on 21.11.2024.
//

import SwiftUI

struct SelectionCardView: View {
    
    @Binding var question: QuestionModel
    @Binding var selectedEntry: [Bool]
    
    
    var queryIndex: Int
    var selectedIndex: Int
    
    var body: some View {
        Button(action: {
            for i in 0..<selectedEntry.count {
                selectedEntry[i] = false
            }
            selectedEntry[selectedIndex] = true
        }) {
            if selectedIndex < selectedEntry.count {
                ZStack(alignment: .leading) {
                    HStack(spacing: 20) {
                        if(question.answerImg.count>0) {
                            Image(question.answerImg[selectedIndex])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .padding(.leading, 40)
                        } else {
                            Spacer()
                                .frame(width: 20)
                        }
                        Text(question.answerText[selectedIndex])
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                            .bold()
                            .multilineTextAlignment(.leading)
                        Spacer()
                        if(question.answerSubText.count>0) {
                            Text(question.answerSubText[selectedIndex])
                                .font(.system(size: 15))
                                .foregroundColor(.black)
                                .bold()
                                .multilineTextAlignment(.trailing)
                                .padding(.trailing, 50)
                            
                        }
                    }
                    RoundedRectangle (cornerRadius: 20)
                        .stroke(selectedEntry[selectedIndex] ? .purple : .gray, lineWidth: 2)
                        .frame(width: 350, height: 80)
                        .padding()
                        .disabled(!selectedEntry[selectedIndex])
                }
            }
        }
    }
}

//#Preview {
//    SelectionCardView(Question: Question, quesryIndex: <#Int#>, selectedEntry: <#Binding<[Bool]>#>, selectedIndex: <#Int#>)
//}


