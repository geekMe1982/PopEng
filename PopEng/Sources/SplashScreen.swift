//
//  SplashScreen.swift
//  PopEng
//
//  Created by Adam Khalifa on 19.08.2024.
//

import SwiftUI

struct SplashScreen: View {
    @State private var show = false
    @State private var showHomeView = false
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                ZStack {
                    Image(.popBalloon)
                        .resizable().scaledToFill()
                        .frame(width: 300, height: 300)
                        .offset(y: showHomeView ? -geo.size.height : 0)
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .background(Image(.splashBackground).resizable().scaledToFill()
                )
                GetStartedView()
                    .frame(width: geo.size.width, height: geo.size.height)
                    .offset(y: showHomeView ? -geo.size.height : 0)
            }
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                    withAnimation(.linear(duration: 1)){
                        showHomeView = true
                    }
                }
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    SplashScreen()
}
