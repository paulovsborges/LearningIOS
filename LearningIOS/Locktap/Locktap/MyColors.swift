//
//  MyColors.swift
//  Locktap
//
//  Created by Borges on 24/06/24.
//

import Foundation
import SwiftUI

extension Color {
    init(red: Int, green: Int, blue: Int, opacity: Double = 1.0) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(
            .sRGB,
            red: Double(red) / 255.0,
            green: Double(green) / 255.0,
            blue: Double(blue) / 255.0,
            opacity: opacity
        )
    }
}

class MyColors{
    static let blue101727 = Color(red: 16, green: 23, blue: 39, opacity: 1)
}
