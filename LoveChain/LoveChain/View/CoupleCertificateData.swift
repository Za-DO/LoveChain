//
//  CoupleCertificateData.swift
//  LoveChain
//
//  Created by 유정인 on 2022/08/21.
//

import SwiftUI

struct CoupleCertificateData {
    let id: Int
    let hashData: String
    let coupleImage: String
    let spotStatement: SpotStatement
}

enum SpotStatement {
    case vacancy
    case soldout
    case select
    
    var spotBackground: Color {
        switch self {
        case .vacancy:
            return .clear
        case .soldout:
            return .subTitleColor
        case .select:
            return .chooseColor
        }
    }
}
