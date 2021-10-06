//
//  LoginViewController.swift
//  CoordinatorsDemo
//
//  Created by Andrei Ionescu on 06/10/2021.
//

import Foundation

import UIKit

class LoginViewController: BaseViewController {
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private var loginButton: UIButton!
    var viewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
    }
    
    @IBAction func tappedLogin(sender: Any) {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        loginButton.isHidden = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.viewModel.tappedLogin()
        }
    }
}
