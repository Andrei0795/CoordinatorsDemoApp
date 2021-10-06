//
//  InfoCoordinator.swift
//  CoordinatorsDemo
//
//  Created by Andrei Ionescu on 06/10/2021.
//

import Foundation

protocol InfoCoordinatorNavigationDelegate: AnyObject {
    func didDismiss(_ coordinator: InfoCoordinator)
}

class InfoCoordinator: NavigationCoordinator {
    weak var navigationDelegate: InfoCoordinatorNavigationDelegate?

    override func start() {
        let viewController: InfoViewController = StoryboardLoader.home.loadViewController()
        let viewModel = InfoViewModel()
        viewModel.navigationDelegate = self
        viewController.viewModel = viewModel
        viewController.hidesBottomBarWhenPushed = true
        start(with: viewController)
    }
}

extension InfoCoordinator: InfoViewModelNavigationDelegate {
    func didDismiss(_ viewModel: InfoViewModel) {
        navigationDelegate?.didDismiss(self)
    }
}
