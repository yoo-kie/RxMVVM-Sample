//
//  RestaurantService.swift
//  RxSwiftMVVM
//
//  Created by 유연주 on 2021/04/10.
//

import Foundation
import RxSwift

/// Protocol을 활용하여 MemberService에 대한 의존성을 분리시킴
protocol MemberServiceProtocol {
    func fetchMembers() -> Observable<[Member]>
}

final class MemberService: MemberServiceProtocol {
    
    /// members.json 파일에서 데이터 가져온 후 decode시킴
    /// - Returns: Observable<[Member]> 반환
    func fetchMembers() -> Observable<[Member]> {
        return Observable.create { observer -> Disposable in
            guard let path = Bundle.main.path(forResource: "members", ofType: "json") else {
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create { }
            }
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let members = try JSONDecoder().decode([Member].self, from: data)
                observer.onNext(members)
            } catch {
                observer.onError(error)
            }
            
            return Disposables.create { }
        }
    }
    
}
