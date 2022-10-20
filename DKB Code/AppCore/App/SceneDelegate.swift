//
//  SceneDelegate.swift
//  DKB Code
//
//  Created by Kumari Ritu Pal on 19/10/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navigationController: CustomNavigationController?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        self.setupRootViewController(scene: scene)
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    private func setupRootViewController(scene: UIScene) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        window?.backgroundColor = .white
        navigationController = CustomNavigationController(rootViewController: createPhotoListViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    private func createPhotoListViewController() -> PhotosListController {
        let client = NetworkClient(session: .shared)
        let networkService = NetworkService(networkClient: client)
        let service = PhotoService(service: networkService)
        let viewModel = PhotoListViewModel.init(service: service)
        let delegate = PhotoListVCDelegate(vm: viewModel)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        delegate.didClick = { [weak self] obj in
            let detailVC = storyboard.instantiateViewController(identifier: "PhotoDetailViewController") { coder in
                PhotoDetailViewController(coder: coder, photo: obj)
            }
            self?.navigationController?.pushViewController(detailVC, animated: false)
        }
        
        let vc = storyboard.instantiateViewController(identifier: "PhotosListController") { coder in
            PhotosListController(coder: coder, viewModel: viewModel, delegate: delegate)
        }
        return vc
    }
}

