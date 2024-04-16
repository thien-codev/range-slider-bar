//
//  View.swift
//  Test
//
//  Created by Nguyen Thien on 16/04/2024.
//

import Foundation
import SwiftUI

private struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGRect = .zero
  static func reduce(value: inout CGRect, nextValue: () -> CGRect) {}
}

extension View {
    func readSize(onChange: @escaping (CGRect) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.frame(in: .global))
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}
