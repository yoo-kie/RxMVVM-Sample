//
//  MembersListViewModel.swift
//  RxSwiftMVVM
//
//  Created by 유연주 on 2021/04/10.
//

import Foundation
import RxSwift

final class MembersListViewModel {
    
    let title: String = "Members"
    
    private let service: MemberServiceProtocol
    
    init(service: MemberServiceProtocol = MemberService()) {
        self.service = service
    }
    
    func fetchMemberViewModel() -> Observable<[MemberViewModel]> {
        service.fetchMembers().map {
            $0.map {
                MemberViewModel(member: $0)
            }
        }
    }
    
}
