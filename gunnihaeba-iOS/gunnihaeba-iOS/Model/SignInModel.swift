//
//  SignInModel.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/21/24.
//

import Foundation

struct SignInModel: Codable {
    var userId: String = ""
    var password: String = ""
    
    var params: [String: Any] {
        return [
            "userId": userId,
            "password": password
        ]
    }
}
