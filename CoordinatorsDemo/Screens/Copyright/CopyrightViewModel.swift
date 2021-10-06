//
//  CopyrightViewModel.swift
//  CoordinatorsDemo
//
//  Created by Andrei Ionescu on 06/10/2021.
//

import Foundation

protocol CopyrightViewModelNavigationDelegate: AnyObject {
    func didDismiss(_ viewModel: CopyrightViewModel)
}

class CopyrightViewModel {
    weak var navigationDelegate: CopyrightViewModelNavigationDelegate?
    
    func tappedDismiss() {
        navigationDelegate?.didDismiss(self)
    }
}
