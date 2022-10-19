//
//  Constants.swift
//  DKB Code
//
//  Created by Kumari Ritu Pal on 19/10/22.
//

import Foundation
import UIKit

enum Constants {
    
    enum Default {
        static let cornerRadius: CGFloat = 8.0
        static let shadowOpacity: Float = 1
        static let shadowRadius: CGFloat = 5
        static let shadowOffset: CGSize = CGSize(width: 1, height: 1)
        static let rowHeight: CGFloat = 100
    }
    
    enum Styles {
        static let mainColor: UIColor = .white
        static let titleColor: UIColor = .black
        static let navBarBgColor: UIColor = .white
        static let imageBgColor: UIColor = .gray
    }
    
    enum NavBarTitles {
        static let photos = "navbar_item_photo".localized()
        static let detail = "navbar_item_detail".localized()
    }
}
