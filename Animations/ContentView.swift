//
//  ContentView.swift
//  Animations
//
//  Created by Waveline Media on 11/30/20.
//

import SwiftUI

struct ContentView: View {
    @State private var stringArray = Array("Hello SwiftUI")
    @State private var dragAmount = CGSize.zero
    @State private var enabled = false
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<stringArray.count) {letterIndex in
                Text(String(self.stringArray[letterIndex]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? Color.red : Color.yellow)
                    .foregroundColor(enabled ? Color.yellow : Color.red)
                    .offset(dragAmount)
                    .animation(Animation.default.delay(Double(letterIndex)/20))
            }
        }
        .gesture(
            DragGesture()
                .onChanged {
                    self.dragAmount = $0.translation
                }
                .onEnded {_ in
                    self.dragAmount = .zero
                    self.enabled.toggle()
                }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
