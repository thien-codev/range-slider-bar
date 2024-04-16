//
//  RangeSliderShape.swift
//  Test
//
//  Created by Nguyen Thien on 16/04/2024.
//

import Foundation
import SwiftUI

struct RangeSliderShape: Shape {
    
    // MARK: Properties
    var height: CGFloat = 100
    var width: CGFloat = 40
    var startPoint: CGPoint = CGPoint(x: 0, y: 20)
    
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get {
            .init(height, startPoint.y)
        }
        set {
            height = newValue.height
            startPoint.y = newValue.yOffset
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let topCurve = CGPoint(x: startPoint.x, y: animatableData.yOffset + 30)
        let topMiddleCurve = CGPoint(x: width + startPoint.x, y: animatableData.yOffset + 30)
        let topMiddlePoint = CGPoint(x: width + startPoint.x, y: animatableData.yOffset + 60)
        
        let bottomPoint = CGPoint(x: startPoint.x, y: animatableData.height + animatableData.yOffset + 120)
        let bottomCurve = CGPoint(x: startPoint.x, y: animatableData.height + animatableData.yOffset + 90)
        let bottomMiddleCurve = CGPoint(x: width + startPoint.x, y: animatableData.height + animatableData.yOffset + 90)
        let bottomMiddlePoint = CGPoint(x: width + startPoint.x, y: animatableData.height + animatableData.yOffset + 60)
        
        path.move(to: startPoint)
        path.addCurve(to: topMiddlePoint, control1: topCurve, control2: topMiddleCurve)
        path.addLine(to: bottomMiddlePoint)
        path.addCurve(to: bottomPoint, control1: bottomMiddleCurve, control2: bottomCurve)
        
        return path
    }
}

private extension AnimatablePair where First == CGFloat, Second == CGFloat {
    var height: CGFloat { first }
    var yOffset: CGFloat { second }
}

