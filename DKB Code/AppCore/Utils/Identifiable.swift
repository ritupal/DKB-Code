//
//  Identifiable.swift
//  DKB Code
//
//  Created by Kumari Ritu Pal on 19/10/22.
//

import Foundation
import UIKit

protocol Identifiable {
    static var reuseIdentifer: String { get }
}

extension Identifiable {
    static var reuseIdentifer: String {
        return String(describing: self)
    }
}

extension UITableViewCell: Identifiable {}
