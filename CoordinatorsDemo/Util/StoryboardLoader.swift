//
//  StoryboardLoader.swift
//  CoordinatorsDemo
//
//  Created by Andrei Ionescu on 06/10/2021.
//

import UIKit

enum StoryboardLoader: String {
    case login = "Login"
    case home = "Home"
    case tabBar = "TabBar"
    case list = "List"
}

extension StoryboardLoader {
    private var current: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: nil)
    }
}

extension StoryboardLoader {
    var rootViewController: UIViewController? {
        return current.instantiateInitialViewController()
    }
    
    var initialViewController: UIViewController? {
        return current.instantiateInitialViewController()
    }
    
    func loadViewController<T: UIViewController>() -> T {
        if let loadedViewController = current.instantiateViewController(identifier: String(describing: T.self)) as? T {
            return loadedViewController
        }
        fatalError("View Controller should have the same Storyboard identifier as its class name!")
    }
}
