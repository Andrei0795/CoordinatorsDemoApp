//
//  TabBarCoordinator.swift
//  CoordinatorsDemo
//
//  Created by Andrei Ionescu on 06/10/2021.
//

import UIKit

protocol TabBarCoordinatorNavigationDelegate: AnyObject {
    func tabBarDidLogout(_ coordinator: TabBarCoordinator)
}

class TabBarCoordinator: Coordinator {
    var tabBarController: CustomTabBarController
    weak var navigationDelegate: TabBarCoordinatorNavigationDelegate?
    
    override init() {
        tabBarController = StoryboardLoader.tabBar.loadViewController()
        super.init()
    }
    
    override func start() {
        //Put all coordinators for all tabs here
        let homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
        homeCoordinator.navigationDelegate = self
        start(homeCoordinator)
        
        let listCoordinator = ListCoordinator(navigationController: UINavigationController())
        listCoordinator.navigationDelegate = self
        start(listCoordinator)
        
        tabBarController.viewControllers = [homeCoordinator.navigationController, listCoordinator.navigationController]
        tabBarController.delegate = self
    }
}

extension TabBarCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard tabBarController.selectedViewController != viewController else {
            return false
        }
        return true
    }
}

extension TabBarCoordinator: HomeCoordinatorNavigationDelegate {
    func didLogout(_ coordinator: HomeCoordinator) {
        navigationDelegate?.tabBarDidLogout(self)
    }
}

extension TabBarCoordinator: ListCoordinatorNavigationDelegate {
}
