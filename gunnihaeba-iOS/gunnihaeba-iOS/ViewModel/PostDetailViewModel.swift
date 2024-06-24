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
    
    @Published var likeCount: Int = 0
    @Published var hateCount: Int = 0
    
    let baseUrl = "http://13.125.220.50:8080"
    
    func getPostLikeHate(postId: Int) {
        AF.request("\(baseUrl)/react/\(postId)", method: .get, headers: [.authorization(bearerToken: LoginUserHashCache.shared.checkAccessToken() ?? LoginUserHashCache.accessToken), .accept("application/json")])
            .responseDecodable(of: Response<ReactData>.self) { response in
                switch response.result {
                case .success(let result):
                    self.likeCount = result.data?.likeCnt ?? 0
                    self.hateCount = result.data?.hateCnt ?? 0
                case .failure(_):
                    break
                }
            }
    }
    
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
    
    func reactToPost(postId: Int, reactType: String) {
        let parameters: [String: Any] = [
            "reactType": reactType
        ]
        
        AF.request("\(baseUrl)/react/\(postId)", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [.authorization(bearerToken: LoginUserHashCache.shared.checkAccessToken() ?? LoginUserHashCache.accessToken), .accept("application/json")])
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print("Response JSON: \(value)")
                    self.getPostLikeHate(postId: postId)
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
    }
}
