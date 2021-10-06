//
//  HomeViewModel.swift
//  CoordinatorsDemo
//
//  Created by Andrei Ionescu on 06/10/2021.
//

import Foundation

protocol HomeViewModelNavigationDelegate: AnyObject {
    func didLogout(_ viewModel: HomeViewModel)
    func showInfoScreen(_ viewModel: HomeViewModel)
    func showCopyrightScreen(_ viewModel: HomeViewModel)
}

class HomeViewModel {
    weak var navigationDelegate: HomeViewModelNavigationDelegate?
    
    func tappedInfo() {
        navigationDelegate?.showInfoScreen(self)
    }
    
    func tappedCopyright() {
        navigationDelegate?.showCopyrightScreen(self)
    }
    
    func tappedLogout() {
        navigationDelegate?.didLogout(self)
    }
}
