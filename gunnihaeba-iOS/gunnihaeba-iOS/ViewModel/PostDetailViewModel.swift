//
//  PostDetailViewModel.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/17/24.
//

import Foundation
import Alamofire

class PostDetailViewModel: ObservableObject {
    @Published var model = PostDetailModel()
    @Published var commentModel = CommentModel()
    @Published var commentResponse = CommentResponse()
    
    let baseUrl = "http://13.125.220.50:8080"
    
    func getPostDetail(postId: Int) {
        AF.request("\(baseUrl)/issue/\(postId)", method: .get, headers: [.authorization(LoginUserHashCache.shared.checkAccessToken() ?? LoginUserHashCache.accessToken)])
            .responseDecodable(of: PostDetailModel.self) { response in
                switch response.result {
                case.success(let data):
                    self.model = data
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    func postComment(postId: Int) {
        var params: [String: Any] {
            return [
                "content": commentModel.content
            ]
        }
        
        AF.request("\(baseUrl)/comment/\(postId)", method: .post, parameters: params, encoding: JSONEncoding.default, headers: [.authorization(bearerToken: LoginUserHashCache.shared.checkAccessToken() ?? LoginUserHashCache.accessToken), .accept("application/json")])
            .responseJSON { json in
                print(json)
            }
    }
    
    func getComment(postId: Int) {
        AF.request("\(baseUrl)/comment/\(postId)", method: .get, headers: [.authorization(bearerToken: LoginUserHashCache.shared.checkAccessToken() ?? LoginUserHashCache.accessToken), .accept("application/json")])
            .responseDecodable(of: CommentResponse.self) { response in
                switch response.result {
                case.success(let data):
                    self.commentResponse = data
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
