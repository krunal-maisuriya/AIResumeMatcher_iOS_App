//
//  AppColors.swift
//  ATSResumeMatcher_iOS_App
//
//  Created by Krunal Maisuriya on 06/11/2026.
//

import SwiftUI
import UIKit

enum AppColors {
    
    static let backgroundColor = Color(
        uiColor: UIColor { trait in
            trait.userInterfaceStyle == .dark
            ? UIColor(hex: "#121819")
            : UIColor(hex: "#F3F2F8")
    })
    
    static let cardColor = Color(
        uiColor: UIColor { trait in
            trait.userInterfaceStyle == .dark
            ? UIColor(hex: "#202829")
            : UIColor(hex: "#FFFFFF")
    })
    
    static let greenColor = UIColor(hex: "#2DBE68")
    static let darkGreenColor = UIColor(hex: "#006400")
    static let redColor = UIColor(hex: "#EF4444")
    static let orangeColor = UIColor(hex: "#F59E0B")
    
}


extension UIColor {
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(
            in: CharacterSet.alphanumerics.inverted
        )

        let value = UInt64(hex, radix: 16) ?? 0

        self.init(
            red: CGFloat((value >> 16) & 0xFF) / 255,
            green: CGFloat((value >> 8) & 0xFF) / 255,
            blue: CGFloat(value & 0xFF) / 255,
            alpha: 1
        )
    }
}

extension Color {
    init(hex: String) {
        self.init(uiColor: UIColor(hex: hex))
    }
}
