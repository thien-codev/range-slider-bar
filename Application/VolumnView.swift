//
//  VolumnView.swift
//  Test
//
//  Created by Nguyen Thien on 16/04/2024.
//

import Foundation
import SwiftUI

struct VolumnView: View {
    
    init(_ startPoint: CGPoint) {
        self.startPoint = startPoint
        self.currentLevelPoint = startPoint
        self.currentContainerPoint = startPoint
    }
    
    private let stepRangeLength: CGFloat = 40
    private let startPoint: CGPoint
    @State var currentLevelPoint: CGPoint
    @State var currentContainerPoint: CGPoint
    
    @State private var isDrag: Bool = false
    @State private var containerHeight: CGFloat = 0
    @State private var levelViewHeight: CGFloat = 0
    
    var body: some View {
        RangeSliderShape(height: containerHeight, startPoint: currentContainerPoint)
            .stroke(lineWidth: 2)
            .foregroundColor(.black)
            .animation(.smooth(extraBounce: 0.1), value: containerHeight)
            .background(alignment: .topLeading, content: {
                RangeLevelView(isDrag: $isDrag, startPoint: $currentLevelPoint)
                    .offset(x: startPoint.x, y: startPoint.y + stepRangeLength)
                    .readSize(onChange: { levelViewHeight = $0.height - stepRangeLength })
            })
            .onChange(of: isDrag) { oldValue, isDrag in
                guard oldValue != isDrag else { return }
                containerHeight = isDrag ? levelViewHeight : .zero
                currentContainerPoint = isDrag ? startPoint : currentLevelPoint
            }
    }
}
