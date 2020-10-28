//
//  AppCoordinator.swift
//  GitHubRepoSearcher
//
//  Created by Vinícius Tinajero Salomão on 27/10/20.
//

import Foundation
import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        navigateToRepositoriesList()
    }
    
    func makeRepositoriesTableViewController() -> RepositoriesTableViewController {
        let viewModel = RepositoriesViewModel()
        return RepositoriesTableViewController(viewModel: viewModel)
    }
    
    func navigateToRepositoriesList() {
        window.rootViewController = makeRepositoriesTableViewController()
        window.makeKeyAndVisible()
    }
    
}
