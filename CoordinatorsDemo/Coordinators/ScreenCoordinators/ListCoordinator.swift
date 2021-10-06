//
//  ListCoordinator.swift
//  CoordinatorsDemo
//
//  Created by Andrei Ionescu on 06/10/2021.
//

import UIKit


protocol ListCoordinatorNavigationDelegate: AnyObject {
}

class ListCoordinator: TabItemCoordinator {
    weak var navigationDelegate: ListCoordinatorNavigationDelegate?
    
    override func start() {
        let listViewController: ListViewController = StoryboardLoader.list.loadViewController()
        let listViewModel = ListViewModel()
        listViewModel.navigationDelegate = self
        listViewController.viewModel = listViewModel
        start(with: listViewController)
        listViewController.navigationController?.isNavigationBarHidden = true
    }
    
    override func tabBarItem() -> UITabBarItem {
        let tabBarItem = UITabBarItem(title: "List", image: UIImage(named: "list_icon"), tag: 1)
        tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 5, vertical: 0)
        return tabBarItem
    }
    
    private func showDetailsScreen(item: ListItem) {
        print("details screen")
    }

}

extension ListCoordinator: ListViewModelNavigationDelegate {
    func didSelectItem(_ viewModel: ListViewModel, item: ListItem) {
        self.showDetailsScreen(item: item)
    }
    
    
}
