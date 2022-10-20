//
//  PhotosListVCDelegate.swift
//  DKB Code
//
//  Created by Kumari Ritu Pal on 19/10/22.
//

import Foundation
import UIKit

class PhotoListVCDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    private let viewModel: PhotoListViewModel
    var didClick: ((Photo?) -> Void)?
    
    init(vm: PhotoListViewModel) {
        self.viewModel = vm
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.photos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotoListCell.reuseIdentifer) as? PhotoListCell else { return UITableViewCell() }
        let viewModel = PhotoListCellViewModel(model: self.viewModel.photos?[indexPath.row])
        cell.configureCell(viewModel: viewModel)
        return cell
    }

//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        UITableView.automaticDimension
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let photos = self.viewModel.photos else { return }
        let photoObj = photos[indexPath.row]
        didClick?(photoObj)
    }
}
