//
//  InfoViewController.swift
//  CoordinatorsDemo
//
//  Created by Andrei Ionescu on 06/10/2021.
//

import UIKit

class InfoViewController: BaseViewController {
    var viewModel: InfoViewModel!
    
    @IBAction func tappedClose(sender: Any) {
        viewModel.tappedDismiss()
    }
}
