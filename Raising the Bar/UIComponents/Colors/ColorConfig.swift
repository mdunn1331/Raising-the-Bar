//
//  ColorConfig.swift
//  Raising the Bar
//
//  Created by Dunn, Michael R on 7/31/19.
//  Copyright © 2019 Dunn, Michael R. All rights reserved.
//

import SwiftUI

extension Color {
    
    static var customBlue: Color {
        return Color(.sRGB, red: 110/255, green: 180/255, blue: 252/255, opacity: 1.0)
    }
    
    static var customPurple: Color {
        return Color(.sRGB, red: 149/255, green: 117/255, blue: 231/255, opacity: 1.0)
    }
    
    static var customGrey: Color {
        return Color(.sRGB, red: 242/255, green: 242/255, blue: 243/255, opacity: 1.0)
    }
    
    static func bluePrupleGradient(start: UnitPoint, end: UnitPoint) -> LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [.customBlue, .customPurple]),
                              startPoint: start,
                              endPoint: end)
    }
}
