//
//  AppDelegate.swift
//  GitHubRepoSearcher
//
//  Created by Vinícius Tinajero Salomão on 26/10/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var coordinator = AppCoordinator(window: window!)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        coordinator.start()
        return true
    }


}

