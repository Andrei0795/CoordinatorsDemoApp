//
//  InfoViewModel.swift
//  CoordinatorsDemo
//
//  Created by Andrei Ionescu on 06/10/2021.
//

import Foundation

protocol InfoViewModelNavigationDelegate: AnyObject {
    func didDismiss(_ viewModel: InfoViewModel)
}

class InfoViewModel {
    weak var navigationDelegate: InfoViewModelNavigationDelegate?
    
    func tappedDismiss() {
        navigationDelegate?.didDismiss(self)
    }
}
