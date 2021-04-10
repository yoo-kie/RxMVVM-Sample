//
//  AppCoordinator.swift
//  RxSwiftMVVM
//
//  Created by 유연주 on 2021/04/10.
//

import UIKit

class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        guard let viewController = ViewController.instantiate() else { return }
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
     
}
