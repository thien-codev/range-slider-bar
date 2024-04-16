//
//  ContentView.swift
//  Test
//
//  Created by Nguyen Thien on 07/04/2024.
//

import SwiftUI

struct ContentView: View {
    
    private let startPoint = CGPoint(x: 0, y: 50)
    
    var body: some View {
        ZStack {
            Color.mint.ignoresSafeArea()
            VolumnView(startPoint)
        }
    }
}

#Preview {
    ContentView()
}
