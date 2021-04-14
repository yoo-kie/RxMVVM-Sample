//
//  AppCoordinator.swift
//  RxSwiftMVVM
//
//  Created by 유연주 on 2021/04/10.
//

import UIKit

/// AppCoordinator
/// 앱 개발 중 "관심사의 분리"를 위한 개념으로 화면 간의 연결/전환의 의존성 분리를 해결
/// 화면 전환에 대한 요청이 coordinator로 들어오면 어떤 화면이 나타나야 하는지 정의
class AppCoordinator {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    /// 화면 transition이 실행되는 메서드
    func start() {
        // 메인 VC 내 viewModel을 외부에서 주입
        guard let viewController = ViewController.instantiate(viewModel: MembersListViewModel())
        else { return }
        
        // window의 rootVC를 viewcontroller를 root로 가진 navigationController로 변경
        // window <- navigationController <- ViewController
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
     
}
