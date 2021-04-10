//
//  MemberViewModel.swift
//  RxSwiftMVVM
//
//  Created by 유연주 on 2021/04/10.
//

import Foundation

struct MemberViewModel {
    
    private let member: Member
    var displayText: String {
        return member.name + " - " + member.gender.rawValue.capitalized
    }
    
    init(member: Member) {
        self.member = member
    }
    
}
