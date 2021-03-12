//
//  UIApplication.swift
//  RepeatCooking
//
//  Created by tiking on 2021/03/10.
//

import SwiftUI
extension UIApplication {
    func closeKeyboard() {
            sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
}
