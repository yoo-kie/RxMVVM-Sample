//
//  ViewController.swift
//  RxSwiftMVVM
//
//  Created by 유연주 on 2021/04/09.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    // VC가 메모리에서 해제됨과 동시에 내부의 모든 Observable이 dispose될 수 있도록-!
    let disposeBag: DisposeBag = DisposeBag()
    private var viewModel: MembersListViewModel!
    
    /// 외부에서 VC를 인스턴스화 및 초기화하는 메서드
    /// - Parameter viewModel: viewModel 주입
    /// - Returns: 스토리보드의 VC 인스턴스화해서 반환
    static func instantiate(viewModel: MembersListViewModel) -> ViewController? {
        let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
        
        guard let viewController = storyboard.instantiateInitialViewController() as? ViewController
        else { return nil }
        
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // bind(to:)는 (@escaping (Int, Sequence.Element, Cell) -> Void)로 커링된 인자값을 가진다.
        // 그리고 Disposable을 반환한다.
        viewModel.fetchMemberViewModel() // Observable<[MemberViewModel]>
            .observe(on: MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
                cell.textLabel?.text = viewModel.displayText
            }
            .disposed(by: disposeBag)
    }
    
}

