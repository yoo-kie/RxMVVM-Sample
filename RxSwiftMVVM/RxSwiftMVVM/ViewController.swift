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
    
    let disposeBag: DisposeBag = DisposeBag()
    private var viewModel: MembersListViewModel!
    var label: UILabel = UILabel()
    
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
        
        // (@escaping (Int, Sequence.Element, Cell) -> Void)로 커링된 인자값을 가진다.
        viewModel.fetchMemberViewModel()
            .observe(on: MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
                cell.textLabel?.text = viewModel.displayText
            }.disposed(by: disposeBag)
    }
    
}

