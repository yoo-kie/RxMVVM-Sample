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
    
    // 의존성 분리를 위해 Protocol 사용?
    init(service: MemberServiceProtocol = MemberService()) {
        self.service = service
    }
    
    func fetchMemberViewModel() -> Observable<[MemberViewModel]> {
        service.fetchMembers() // Observable<[Member]>
            .map {
                $0.map { MemberViewModel(member: $0) } // Member를 MemberViewModel로 변환
            }
    }
    
}
