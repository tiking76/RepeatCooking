//
//  Color.swift
//  RepeatCooking
//
//  Created by tiking on 2021/03/15.
import Foundation
import SwiftUI

extension UIColor {
    static let lightOrange = UIColor(red: 255/255, green: 249/255, blue: 249/255, alpha: 1)
}

// test color
enum ColorAssets {
    case lightOrange
    var name: String {
        switch self {
        case .lightOrange:
            return "lightOrange"
        }
    }
    var color: Color {
        return Color(name)
    }
    var uiColor: UIColor? {
        return UIColor(named: name)
    }
}
