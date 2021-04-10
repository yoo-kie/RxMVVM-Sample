//
//  Restaurant.swift
//  RxSwiftMVVM
//
//  Created by 유연주 on 2021/04/10.
//

import Foundation

struct Member: Decodable {
    let name: String
    let gender: Gender
}

enum Gender: String, Decodable {
    case female
    case male
}
