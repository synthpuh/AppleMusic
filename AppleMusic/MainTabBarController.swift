//
//  MainTabBarController.swift
//  AppleMusic
//
//  Created by Ольга Шубина on 03.10.2021.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        UITabBar.appearance().tintColor = .systemPink
        
        let searchVC: SearchViewController = SearchViewController.loadFromStoryboard()
        
        viewControllers = [
            generateVC(rootVC: searchVC, image: UIImage(imageLiteralResourceName: "ios10-apple-music-search-5nav-icon"), title: "Search"),
            //generateVC(rootVC: LibraryViewController(), image: UIImage(imageLiteralResourceName: "ios10-apple-music-library-5nav-icon"), title: "Library")
        ]
    }
    
    private func generateVC(rootVC: UIViewController, image: UIImage, title: String) -> UIViewController {
        
        let navigationVC = UINavigationController(rootViewController: rootVC)
        
        //navigationVC.tabBarItem.image = image
        //navigationVC.tabBarItem.title = title
        navigationVC.navigationBar.prefersLargeTitles = true
        
        rootVC.navigationItem.title = title
        
        return navigationVC
        
    }
    
}
