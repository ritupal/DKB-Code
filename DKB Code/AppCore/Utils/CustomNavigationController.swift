//
//  CustomNavigationController.swift
//  DKB Code
//
//  Created by Kumari Ritu Pal on 19/10/22.
//

import Foundation
import UIKit

/// This is custom navigation controller in which all the controllers stacks up
class CustomNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        setupNavigationBarStyle()
        self.delegate = self
    }
    
    private func setupNavigationBarStyle() {
        self.navigationBar.isHidden = false
        self.navigationBar.isTranslucent = false
        self.navigationBar.tintColor = Constants.Styles.titleColor
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = Constants.Styles.navBarBgColor
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
    }

}

extension CustomNavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: String(), style: .plain, target: nil, action: nil)
    }
    
}
