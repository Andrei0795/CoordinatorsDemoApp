//
//  LoginViewModel.swift
//  CoordinatorsDemo
//
//  Created by Andrei Ionescu on 06/10/2021.
//

import Foundation

protocol LoginViewModelNavigationDelegate: AnyObject {
    func didLogin(_ viewModel: LoginViewModel)
}

class LoginViewModel {
    weak var navigationDelegate: LoginViewModelNavigationDelegate?
    
    func tappedLogin() {
        navigationDelegate?.didLogin(self)
    }
}
