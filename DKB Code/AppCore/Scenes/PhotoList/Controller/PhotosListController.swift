//
//  HomeViewController.swift
//  DKB Code
//
//  Created by Kumari Ritu Pal on 19/10/22.
//

import UIKit

class PhotosListController: UIViewController {
    
    // MARK: - Outlets and Properties
    @IBOutlet private weak var tableViewPhotos: UITableView!
    
    private let viewModel: PhotoListViewModel
    let tableDelegate: (UITableViewDelegate & UITableViewDataSource)
    
    // MARK: - Initializer
    init?(coder: NSCoder, viewModel: PhotoListViewModel, delegate: (UITableViewDelegate & UITableViewDataSource)) {
        self.viewModel = viewModel
        self.tableDelegate = delegate
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.fetchPhotosList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = Constants.NavBarTitles.photos
        super.viewWillAppear(animated)
    }
    
    // MARK: - Methods
    private func setupTableView() {
        self.tableViewPhotos.dataSource = tableDelegate
        self.tableViewPhotos.delegate = tableDelegate
        self.tableViewPhotos.register(UINib(nibName: PhotoListCell.reuseIdentifer, bundle: .main), forCellReuseIdentifier: PhotoListCell.reuseIdentifer)
        self.tableViewPhotos.tableFooterView = UIView.init(frame: .zero)
        self.tableViewPhotos.rowHeight = Constants.Default.rowHeight
        self.tableViewPhotos.backgroundColor = Constants.Styles.defaultBgColor
    }
    
    private func fetchPhotosList() {
        viewModel.fetchPhotos()
        viewModel.onPhotoUpdate = { [weak self] in
            DispatchQueue.main.async {
                self?.tableViewPhotos.reloadData()
            }
        }
    }
}
