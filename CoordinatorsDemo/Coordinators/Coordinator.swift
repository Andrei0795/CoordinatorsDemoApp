//
//  Coordinator.swift
//  CoordinatorsDemo
//
//  Created by Andrei Ionescu on 06/10/2021.
//

import UIKit

enum TransitionStyle {
    case push
    case modal
    case none
}

protocol CoordinatorProtocol {
    var childCoordinators: [String: CoordinatorProtocol] { get set }
    
    func identifier() -> String
    static func identifier() -> String
    
    func start()
    func start(_ coordinator: CoordinatorProtocol)
    
    func retain(_ coordinator: CoordinatorProtocol)
    func release(_ coordinator: CoordinatorProtocol)
}


class Coordinator: NSObject, CoordinatorProtocol {
    func identifier() -> String {
        return String(describing: type(of: self))
    }
    
    static func identifier() -> String {
        return String(describing: self)
    }
    
    func retain(_ coordinator: CoordinatorProtocol) {
        childCoordinators[coordinator.identifier()] = coordinator
    }
    
    func release(_ coordinator: CoordinatorProtocol) {
        childCoordinators[coordinator.identifier()] = nil
    }
    
    func releaseAllCoordinators() {
        childCoordinators.removeAll()
    }
    
    var childCoordinators: [String : CoordinatorProtocol] = [:]
    
    func start() {
        assertionFailure("This method must be implemented by subclasses")
    }
    
    func start(_ coordinator: CoordinatorProtocol) {
        retain(coordinator)
        coordinator.start()
    }
}

class NavigationCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(with viewController: UIViewController, presentation: TransitionStyle = .push) {
        
        switch presentation {
        case .push:
            navigationController.pushViewController(viewController, animated: true)
        case .modal:
            navigationController.present(viewController, animated: true, completion: nil)
        case .none:
            break
        }
    }
}

class TabItemCoordinator: NavigationCoordinator {
    func tabBarItem() -> UITabBarItem {
        assertionFailure("This method must be implemented by subclasses")
        return UITabBarItem()
    }
    
    override func start(with viewController: UIViewController, presentation: TransitionStyle = .push) {
        let barItem = tabBarItem()
        barItem.imageInsets = UIEdgeInsets.init(top: -5, left: 0, bottom: 5, right: 0)
        barItem.titlePositionAdjustment = UIOffset.init(horizontal: barItem.titlePositionAdjustment.horizontal, vertical: -5)
        barItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)], for: .normal)
        viewController.tabBarItem = barItem
        super.start(with: viewController, presentation: presentation)
    }
}
