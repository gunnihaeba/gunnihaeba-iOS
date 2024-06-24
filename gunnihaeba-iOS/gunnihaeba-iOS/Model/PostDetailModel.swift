//
//  PostDetailModel.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/17/24.
//

import Foundation

struct PostDetailModel: Codable {
    var status: Int = 0
    var message: String = ""
    var data: Datas = Datas()
}

struct Datas: Codable {
    var title: String = ""
    var content: String = ""
    var writer: String = ""
    var date: String = ""
}

struct CommentModel: Codable {
    var content: String = ""
    var issueId: Int = 0
}

struct CommentResponse: Codable {
    var status: Int = 0
    var message: String = ""
    var data: [CommentData] = []
}

struct CommentData: Codable {
    var writer: String = ""
    var content: String = ""
    var date: String = ""
}

struct ReactData: Decodable {
    var likeCnt: Int = 0
    var hateCnt: Int = 0
    var userReact: String = "LIKE"
}
