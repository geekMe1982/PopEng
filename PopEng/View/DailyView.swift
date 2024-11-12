//
//  DailyView.swift
//  PopEng
//
//  Created by Adam Khalifa on 30.08.2024.
//

import SwiftUI

struct DailyView: View {
    var name = "Adam"
    let blocks = ["1", "2", "3", "4", "5", "6"]
    var body: some View {
        NavigationView {
            ScrollView(.horizontal){
                LazyHStack() {
                        Section(header: Text("Hello")){
                            ForEach(blocks, id: \.self) { block in
                            Rectangle()
                                .frame(width: 200.0, height: 300.0)
                        }
                   }
                    .padding()
                }
                .navigationTitle("Good day!\(name)")
            }
        }
    }
}

#Preview {
    DailyView()
}
