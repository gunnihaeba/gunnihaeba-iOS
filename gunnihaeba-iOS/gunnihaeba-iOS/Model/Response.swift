//
//  Response.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/22/24.
//

import Foundation

struct Response<T: Decodable> : Decodable {
    let status : Int
    let message : String
    let data : T?
}

struct ErrorResponse: Decodable {
    let status: Int
    let code: String
    let message: String
}
