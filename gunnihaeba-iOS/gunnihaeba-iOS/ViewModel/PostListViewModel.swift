//
//  PostListViewModel.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/22/24.
//

import Foundation
import Alamofire

class PostListViewModel: ObservableObject {
    @Published var model = PostListModel()
    
    func fetchPosts(page: Int, size: Int) {
        let url = "http://13.125.220.50:8080/issue/list"
        
        let parameters: [String: Any] = [
            "page": page,
            "size": size
        ]
        
        AF.request(url, method: .get, parameters: parameters, headers: [.authorization(bearerToken: LoginUserHashCache.shared.checkAccessToken() ?? LoginUserHashCache.accessToken)])
            .validate()
            .responseDecodable(of: PostListModel.self) { response in
                switch response.result {
                case .success(let data):
                    self.model = data
                case .failure(let error):
                    print("Error fetching posts: \(error)")
                    if let data = response.data,
                       let errorMessage = String(data: data, encoding: .utf8) {
                        print("Server error message: \(errorMessage)")
                    }
                }
            }
        
    }
}
