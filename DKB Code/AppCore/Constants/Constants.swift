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
        static let titleColor: UIColor = .white
        static let navBarBgColor: UIColor = UIColor(red: 46.0/255.0, green: 61.0/255.0, blue: 108.0/255.0, alpha: 1.0)
        static let imageBgColor: UIColor = .gray
        static let defaultBgColor: UIColor = UIColor(red: 156.0/255.0, green: 218.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        static let cellTitleColor: UIColor = .black
    }
    
    enum NavBarTitles {
        static let photos = "navbar_item_photo".localized()
        static let detail = "navbar_item_detail".localized()
    }
}
