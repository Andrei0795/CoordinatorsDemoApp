//
//  AppCoordinator.swift
//  CoordinatorsDemo
//
//  Created by Andrei Ionescu on 06/10/2021.
//

import UIKit

class AppCoordinator: Coordinator {
    private(set) var window: UIWindow!
    private var tabCoordinator: TabBarCoordinator!
    private var loginCoordinator: LoginCoordinator!
    private var shouldShowLogin: Bool = true
    
    init(window: UIWindow) {
        self.window = window
        super.init()
    }
    
    override func start() {
        if shouldShowLogin {
            showLoginScreen()
        } else {
            showTabBar()
        }
    }
    
    func showLoginScreen() {
        loginCoordinator = LoginCoordinator()
        loginCoordinator.navigationDelegate = self
        start(loginCoordinator)
        window.rootViewController = loginCoordinator.viewController
    }
    
    func showTabBar() {
        tabCoordinator = TabBarCoordinator()
        tabCoordinator.navigationDelegate = self
        start(tabCoordinator)
        window.rootViewController = tabCoordinator.tabBarController
    }
}

extension AppCoordinator: TabBarCoordinatorNavigationDelegate {
    func tabBarDidLogout(_ coordinator: TabBarCoordinator) {
        showLoginScreen()
        release(coordinator)
    }
}

extension AppCoordinator: LoginCoordinatorNavigationDelegate {
    func didLogin(_ coordinator: LoginCoordinator) {
        showTabBar()
        release(coordinator)
    }
}
