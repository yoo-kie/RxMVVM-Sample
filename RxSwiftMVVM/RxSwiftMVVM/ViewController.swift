//
//  ViewController.swift
//  RxSwiftMVVM
//
//  Created by 유연주 on 2021/04/09.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    let disposeBag: DisposeBag = DisposeBag()
    
    static func instantiate() -> ViewController? {
        let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
        
        guard let viewController = storyboard.instantiateInitialViewController() as? ViewController
        else { return nil }
        
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = MemberService()
        service.fetchMembers()
            .subscribe(
                onNext: { members in
                    print(members)
                },
                onError: { error in
                    print(error)
                }
            ).disposed(by: disposeBag)
    }
    
}

