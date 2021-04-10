//
//  RestaurantService.swift
//  RxSwiftMVVM
//
//  Created by 유연주 on 2021/04/10.
//

import Foundation
import RxSwift

class MemberService {
    
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
