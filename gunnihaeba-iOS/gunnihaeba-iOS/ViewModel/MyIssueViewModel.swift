//
//  MyIssueViewModel.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/22/24.
//

import Foundation
import Alamofire

class MyIssueViewModel: ObservableObject {
    @Published var model = MyIssueModel()
    
    let baseUrl = "http://13.125.220.50:8080"
    
    func getLists() {
        AF.request("\(baseUrl)/issue/user", method: .get, headers: [.authorization(bearerToken: LoginUserHashCache.shared.checkAccessToken() ?? LoginUserHashCache.accessToken)])
            .responseDecodable(of: MyIssueModel.self) { respones in
                switch respones.result {
                case.success(let data):
                    self.model = data
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func deletePost(postId: Int) {
        AF.request("\(baseUrl)/issue/\(postId)", method: .delete, headers: [.authorization(bearerToken: LoginUserHashCache.shared.checkAccessToken() ?? LoginUserHashCache.accessToken)])
            .responseJSON { json in
                print(json)
            }
    }
}
