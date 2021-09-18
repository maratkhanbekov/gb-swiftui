//
//  Color.swift
//  gb-swiftui
//
//  Created by Marat Khanbekov on 18.09.2021.
//

import SwiftUI

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
