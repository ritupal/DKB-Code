//
//  PhotoListCell.swift
//  DKB Code
//
//  Created by Kumari Ritu Pal on 19/10/22.
//

import UIKit
import SDWebImage

class PhotoListCell: UITableViewCell {
    
    //MARK:- Outlets and properties
    @IBOutlet private weak var viewMain: UIView!
    @IBOutlet private weak var labelTitle: UILabel!
    @IBOutlet private weak var imageViewThumbnail: UIImageView!
    
    //MARK:- viewLife cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
        
    }

    //MARK:- Methods
    private func setupUI() {
        self.backgroundColor = Constants.Styles.defaultBgColor
        self.viewMain.layer.cornerRadius = Constants.Default.cornerRadius
        self.imageViewThumbnail.layer.cornerRadius = Constants.Default.cornerRadius
        self.viewMain.backgroundColor = Constants.Styles.mainColor
        self.imageViewThumbnail.backgroundColor = Constants.Styles.imageBgColor
        self.viewMain.addShadow(opacity: Constants.Default.shadowOpacity, color: Constants.Styles.mainColor, radius: Constants.Default.shadowRadius, offset: Constants.Default.shadowOffset)
        self.labelTitle.textColor = Constants.Styles.cellTitleColor
    }
    
    func configureCell(viewModel: PhotoListCellViewModel) {
        self.labelTitle.text = viewModel.title
        guard let url = viewModel.imageUrl, let imageURL = URL(string: url) else { return }
        self.imageViewThumbnail.sd_setImage(with: imageURL)
    }
}
