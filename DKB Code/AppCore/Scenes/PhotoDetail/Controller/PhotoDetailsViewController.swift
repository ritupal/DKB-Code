//
//  PhotoDetailViewController.swift
//  DKB Code
//
//  Created by Kumari Ritu Pal on 20/10/22.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet private weak var imageViewFull: UIImageView!
    private let photo: Photo?

    init?(coder: NSCoder, photo: Photo?) {
        self.photo = photo
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = Constants.NavBarTitles.detail
        self.setData()
    }
    
    private func setData() {
        guard let photo = self.photo, let url = photo.url, let imageURL = URL(string: url) else { return }
        self.imageViewFull.sd_setImage(with: imageURL)
    }

}
