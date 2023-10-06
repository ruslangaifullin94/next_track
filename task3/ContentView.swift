//
//  ContentView.swift
//  task3
//
//  Created by Руслан Гайфуллин on 05.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAnimate: Bool = false
        
        @Namespace private var namespace
        
        private let playImageName = "play.fill"
        
        private let matchedGeometryId = "Play"

        var body: some View {
            VStack {
                Button {
                    withAnimation(.interpolatingSpring(stiffness: 150, damping: 15)) {
                        isAnimate.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        isAnimate.toggle()
                    }
                } label: {
                    ZStack {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 80))
                            .foregroundStyle(.gray)
                            .offset(x: 15)
                            .scaleEffect(isAnimate ? 1 : 0.2)
                            .opacity(isAnimate ? 0 : 1)
                        Image(systemName: playImageName)
                            .font(.system(size: 40))
                            .scaleEffect(isAnimate ? 1 : 0)
                            .opacity(isAnimate ? 1 : 0.5)
                            .offset(x: 0)
                            .matchedGeometryEffect(id: matchedGeometryId, in: namespace)
                        Image(systemName: playImageName)
                            .font(.system(size: 40))
                            .offset(x: isAnimate ? 30 : 0)
                            .matchedGeometryEffect(id: matchedGeometryId, in: namespace)
                        Image(systemName: playImageName)
                            .font(.system(size: 40))
                            .scaleEffect(isAnimate ? 0 : 1)
                            .offset(x: 30)
                            .opacity(isAnimate ? 0.5 : 1)
                            .matchedGeometryEffect(id: playImageName, in: namespace)
                        
                    }.offset(x: -10)
                }
                .buttonStyle(.plain)
                .foregroundStyle(.blue)
            }
        }
}

#Preview {
    ContentView()
}
