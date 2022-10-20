//
//  UIView+Extension.swift
//  DKB Code
//
//  Created by Kumari Ritu Pal on 20/10/22.
//

import Foundation
import UIKit

extension UIView {
    
    func addShadow(opacity: Float, color: UIColor? = nil, radius: CGFloat? = nil, offset: CGSize? = nil) {
        if let shadowColor = color {
            self.layer.shadowColor = shadowColor.cgColor
        }
        if let radius = radius {
            self.layer.shadowRadius = radius
        }
        if let offset = offset {
            self.layer.shadowOffset = offset
        }
        self.layer.shadowOpacity = opacity
    }
}
