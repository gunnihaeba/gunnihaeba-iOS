//
//  PostListModel.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/22/24.
//

import Foundation

struct PostListModel: Codable {
    var status: Int = 0
    var message: String = ""
    var data: [Post] = []
}

struct Post: Codable {
    var id: Int = 0
    var title: String = ""
    var date: String = ""
}
