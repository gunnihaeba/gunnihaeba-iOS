//
//  TokenModel.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/21/24.
//

import Foundation

struct TokenModel: Codable {
    var status: Int = 0
    var message: String = ""
    var data: DataClass = DataClass()
}

struct DataClass: Codable {
    var accessToken: String = ""
    var refreshToken: String = ""
}
