//
//  PostDetailModel.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/17/24.
//

import Foundation


struct PostDetailModel: Codable {
    var title: String = ""
    var writer: String = ""
    var createdDate: String = ""
    var content: String = ""
    var like: Int = 0
    var hate: Int = 0
}
