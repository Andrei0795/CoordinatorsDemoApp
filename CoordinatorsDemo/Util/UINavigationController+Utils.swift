//
//  UINavigationController+Utils.swift
//  CoordinatorsDemo
//
//  Created by Andrei Ionescu on 06/10/2021.
//

import UIKit

extension UINavigationController {
    class func getModalNavigationController() -> UINavigationController {
        let navController = UINavigationController()
        navController.modalPresentationStyle = .overFullScreen
        navController.isNavigationBarHidden = true
        
        return navController
    }
}
