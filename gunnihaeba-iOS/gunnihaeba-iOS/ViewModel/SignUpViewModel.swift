//
//  SignUpViewModel.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/21/24.
//

import Foundation
import Alamofire

class SignUpViewModel: ObservableObject {
    @Published var model = SignUpModel()
    
    func signUp() {
        let baseUrl = "http://13.125.220.50:8080"
        
        AF.request("\(baseUrl)/auth/sign-up", method: .post, parameters: model.params, encoding: JSONEncoding.default)
            .responseJSON { json in
                print(json)
            }
            .response { response in
                switch response.result {
                case .success(let data):
                    print("\(String(describing: data))")
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
            }
    }
}
