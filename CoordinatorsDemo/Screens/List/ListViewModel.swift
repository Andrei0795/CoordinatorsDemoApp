//
//  ListViewModel.swift
//  CoordinatorsDemo
//
//  Created by Andrei Ionescu on 06/10/2021.
//

import Foundation

protocol ListViewModelNavigationDelegate: AnyObject {
    func didSelectItem(_ viewModel: ListViewModel, item: ListItem)
}

class ListViewModel {
    weak var navigationDelegate: ListViewModelNavigationDelegate?
}
