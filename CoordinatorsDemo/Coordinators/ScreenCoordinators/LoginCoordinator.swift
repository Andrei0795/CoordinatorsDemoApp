//
//  LoginCoordinator.swift
//  CoordinatorsDemo
//
//  Created by Andrei Ionescu on 06/10/2021.
//

import Foundation

protocol LoginCoordinatorNavigationDelegate: AnyObject {
    func didLogin(_ coordinator: LoginCoordinator)
}

class LoginCoordinator: Coordinator {
    weak var navigationDelegate: LoginCoordinatorNavigationDelegate?
    var viewController: LoginViewController
    
    override init() {
        viewController = StoryboardLoader.tabBar.loadViewController()
        super.init()
    }
    
    override func start() {
        let viewModel = LoginViewModel()
        viewModel.navigationDelegate = self
        viewController.viewModel = viewModel
    }
}

extension LoginCoordinator: LoginViewModelNavigationDelegate {
    func didLogin(_ viewModel: LoginViewModel) {
        navigationDelegate?.didLogin(self)
    }
}
