//
//  ContentView.swift
//  Animations
//
//  Created by Waveline Media on 11/30/20.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmountDegree = 0.0

    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                self.animationAmountDegree += 360
            }
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmountDegree), axis: (x: 0, y: 0, z: 1))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
