//
//  SignUpModel.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/21/24.
//

import Foundation

struct SignUpModel: Codable {
    var userId: String = ""
    var password: String = ""
    var name: String = ""
    
    var params: [String: Any] {
        return [
            "userId": userId,
            "password": password,
            "name": name
        ]
    }
}
