//
//  MyIssueModel.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/22/24.
//

import Foundation

struct MyIssueModel: Codable {
    var status: Int = 0
    var message: String = ""
    var data: [Datum] = []
}

struct Datum: Codable {
    var id: Int = 0
    var title: String = ""
    var date: String = ""
}
