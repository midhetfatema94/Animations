//
//  ContentView.swift
//  Animations
//
//  Created by Waveline Media on 11/30/20.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingShape = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    self.isShowingShape.toggle()
                }
            }
            if isShowingShape {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
    }
}

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchorPoint: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchorPoint)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active:
                CornerRotateModifier(amount: -90, anchorPoint: .topLeading),
            identity:
                CornerRotateModifier(amount: 0, anchorPoint: .topLeading)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
