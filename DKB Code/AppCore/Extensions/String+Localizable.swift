//
//  String+Localizable.swift
//  DKB Code
//
//  Created by Kumari Ritu Pal on 19/10/22.
//

import Foundation

// This extension is used to get the localized string and "localized" function is used for it
extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}
