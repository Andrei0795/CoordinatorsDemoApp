//
//  CopyrightViewController.swift
//  CoordinatorsDemo
//
//  Created by Andrei Ionescu on 06/10/2021.
//

import UIKit

class CopyrightViewController: BaseViewController {
    var viewModel: CopyrightViewModel!
    
    @IBAction func tappedClose(sender: Any) {
        viewModel.tappedDismiss()
    }
}
