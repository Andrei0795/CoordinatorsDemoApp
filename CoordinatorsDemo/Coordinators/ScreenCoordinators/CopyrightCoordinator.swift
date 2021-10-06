//
//  CopyrightCoordinator.swift
//  CoordinatorsDemo
//
//  Created by Andrei Ionescu on 06/10/2021.
//

import UIKit

protocol CopyrightCoordinatorNavigationDelegate: AnyObject {
    func didDismiss(_ coordinator: CopyrightCoordinator)
}

class CopyrightCoordinator: NavigationCoordinator {
    weak var navigationDelegate: CopyrightCoordinatorNavigationDelegate?

    override func start() {
        let viewController: CopyrightViewController = StoryboardLoader.home.loadViewController()
        let viewModel = CopyrightViewModel()
        viewModel.navigationDelegate = self
        viewController.viewModel = viewModel
        start(with: viewController)
    }
}

extension CopyrightCoordinator: CopyrightViewModelNavigationDelegate {
    func didDismiss(_ viewModel: CopyrightViewModel) {
        navigationDelegate?.didDismiss(self)
    }
}
