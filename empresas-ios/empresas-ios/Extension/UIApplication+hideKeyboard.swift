//
//  UIApplication+hideKeyboard.swift
//  empresas-ios
//
//  Created by Rodrigo Guimarães on 08/10/20.
//

import UIKit

extension UIApplication {
    func hideKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
