//
//  HomeViewController.swift
//  CoordinatorsDemo
//
//  Created by Andrei Ionescu on 06/10/2021.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet private var infoButton: UIButton!
    @IBOutlet private var copyrightButton: UIButton!
    @IBOutlet private var logoutButton: UIButton!

    var viewModel: HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tappedInfoButton(sender: Any) {
        viewModel.tappedInfo()
    }
    
    @IBAction func tappedCopyrightButton(sender: Any) {
        viewModel.tappedCopyright()
    }
    
    @IBAction func tappedLogoutButton(sender: Any) {
        viewModel.tappedLogout()
    }
}
