//
//  MainTabBarController.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 02/02/2025.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureTabbars()
        
    }
    
    
   
}
//MARK: - View Configurator
extension MainTabBarController {
    private func configureViewModel(with cateType:MovieCategoryTypes) -> MoviesViewModel  {
        let viewModel = MoviesViewModel(cateType: cateType )
        return viewModel
    }
    private func configureViewController(with viewModel: MoviesViewModel) -> UIViewController {
       return MoviesViewController(viewModel: viewModel )
    }
}
//MARK: - Setup UI
extension MainTabBarController {
    
    private func configureTabbars() {
        let nowPlayingVC = self.configureViewController(with: self.configureViewModel(with: .nowPlaying(page: 1)))
        let upcomingVC   =  self.configureViewController(with: self.configureViewModel(with: .upcoming(page: 1)))
        let popularVC    = self.configureViewController(with: self.configureViewModel(with: .popular(page: 1)))

        nowPlayingVC.tabBarItem = UITabBarItem(title: "Now Playing", image: UIImage(systemName: "play.circle"), tag: 0)
        upcomingVC.tabBarItem = UITabBarItem(title: "Upcoming", image: UIImage(systemName: "calendar.circle"), tag: 1)
        popularVC.tabBarItem = UITabBarItem(title: "Popular", image: UIImage(systemName: "star.circle"), tag: 2)

        viewControllers = [UINavigationController(rootViewController: nowPlayingVC),
                           UINavigationController(rootViewController: popularVC),
                           UINavigationController(rootViewController: upcomingVC)]
    }
    
}
