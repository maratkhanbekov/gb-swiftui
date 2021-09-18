//
//  Header.swift
//  gb-swiftui
//
//  Created by Marat Khanbekov on 18.09.2021.
//

import Foundation
import SwiftUI


struct HeaderModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(size: 28, weight: .heavy))
            .foregroundColor(Color.black)
    
    }
}

struct SubHeaderModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(size: 16))
            .foregroundColor(Color.blue)
    }
}

struct ModeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.font(.system(size: 12))
            .foregroundColor(Color.gray)
    }
}


struct CircleShadow: ViewModifier {
    let shadowColor: Color
    let shadowRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(Circle()
                .fill(Color.white)
                .shadow(color: shadowColor, radius: shadowRadius))
    }
}
