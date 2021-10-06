//
//  HomeCoordinator.swift
//  CoordinatorsDemo
//
//  Created by Andrei Ionescu on 06/10/2021.
//

import UIKit

protocol HomeCoordinatorNavigationDelegate: AnyObject {
    func didLogout(_ coordinator: HomeCoordinator)
}

class HomeCoordinator: TabItemCoordinator {
    weak var navigationDelegate: HomeCoordinatorNavigationDelegate?
    
    override func start() {
        let homeViewController: HomeViewController = StoryboardLoader.home.loadViewController()
        let homeViewModel = HomeViewModel()
        homeViewModel.navigationDelegate = self
        homeViewController.viewModel = homeViewModel
        start(with: homeViewController)
        homeViewController.navigationController?.isNavigationBarHidden = true
    }
    
    override func tabBarItem() -> UITabBarItem {
        let tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home_icon"), tag: 0)
        tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 5, vertical: 0)
        return tabBarItem
    }
    
    private func showInfoScreen() {
        let coordinator = InfoCoordinator(navigationController: navigationController)
        coordinator.navigationDelegate = self
        start(coordinator)
    }
    
    private func showCopyrightScreen() {
        let navController = UINavigationController.getModalNavigationController()
        let coordinator = CopyrightCoordinator(navigationController: navController)
        coordinator.navigationDelegate = self
        start(coordinator)
        navigationController.present(navController, animated: true, completion: nil)
    }
}

extension HomeCoordinator: HomeViewModelNavigationDelegate {
    func didLogout(_ viewModel: HomeViewModel) {
        navigationDelegate?.didLogout(self)
    }
    
    func showInfoScreen(_ viewModel: HomeViewModel) {
        self.showInfoScreen()
    }
    
    func showCopyrightScreen(_ viewModel: HomeViewModel) {
        self.showCopyrightScreen()
    }
}

extension HomeCoordinator: CopyrightCoordinatorNavigationDelegate {
    func didDismiss(_ coordinator: CopyrightCoordinator) {
        navigationController.dismiss(animated: true, completion: {
            self.release(coordinator)
        })
    }
}

extension HomeCoordinator: InfoCoordinatorNavigationDelegate {
    func didDismiss(_ coordinator: InfoCoordinator) {
        navigationController.popViewController(animated: true)
        release(coordinator)
    }
}
