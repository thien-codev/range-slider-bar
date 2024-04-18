//
//  RangeLevelView.swift
//  Test
//
//  Created by Nguyen Thien on 16/04/2024.
//

import Foundation
import SwiftUI

struct RangeLevelView: View {
    
    @Binding var isDrag: Bool
    @Binding var startPoint: CGPoint
    @Binding var value: Int
    @State var pointerPoint = CGPoint(x: 0, y: 12) // y = (stepRangeLength - pointerWidth) / 2
    
    private let stepRangeLength: CGFloat = 40
    private let pointerWidth: CGFloat = 16
    
    var body: some View {
        ZStack(alignment: .top) {
            rangeView
            pointerView
        }
    }
    
    var rangeView: some View {
        VStack(spacing: 0) {
            Group {
                ForEach(0..<6, id: \.self) { _ in
                    Circle().stroke(lineWidth: 1).frame(height: 40)
                }
            }
            .foregroundColor(.clear)
            .background(content: {
                if isDrag {
                    Circle().frame(width: 4)
                }
            })
            .animation(.easeIn(duration: isDrag ? 0.5 : 0), value: isDrag)
        }
    }
    
    var pointerView: some View {
        Circle()
            .frame(width: pointerWidth)
            .offset(y: pointerPoint.y)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        updatePoint(with: value.location.y)
                        isDrag = true
                    })
                    .onEnded({ value in
                        isDrag = false
                    })
            )
            .animation(.bouncy, value: startPoint)
    }
    
    func updatePoint(with newDragYoffset: CGFloat) {
        let eachStep: CGFloat = 40
        let min: CGFloat = 20
        let max: CGFloat = 220
        
        guard newDragYoffset > min, newDragYoffset < max else { return }
        let moreStep = Int((newDragYoffset - pointerPoint.y) / (eachStep / 2))
        
        value = value + moreStep
        startPoint = .init(x: startPoint.x, y: startPoint.y + CGFloat(moreStep) * eachStep)
        pointerPoint.y = pointerPoint.y + CGFloat(moreStep) * eachStep
    }
}

