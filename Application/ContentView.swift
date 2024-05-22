//
//  ContentView.swift
//  Test
//
//  Created by Nguyen Thien on 07/04/2024.
//

import SwiftUI

struct ContentView: View {
    
    private let startPoint = CGPoint(x: 0, y: 0)
    @State var rangeLevel: Int = 2
    
    var body: some View {
        ZStack {
            Color.mint.ignoresSafeArea()
            Circle().frame(width: 20 * CGFloat(rangeLevel)).foregroundColor(.indigo)
                .animation(.bouncy, value: rangeLevel)
            VolumnView(startPoint, value: $rangeLevel)
        }
    }
}

#Preview {
    ContentView()
}
