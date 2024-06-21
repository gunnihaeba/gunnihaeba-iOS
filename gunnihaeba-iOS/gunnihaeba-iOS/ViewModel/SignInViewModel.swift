//
//  SignInViewModel.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/21/24.
//

import Foundation
import Alamofire
import SwiftUI

class SignInViewModel: ObservableObject {
    @Published var model = SignInModel()
    
    func signin() {
        guard let viewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
        
        let nextVC = UIHostingController(rootView: NavigationView { ContentView() })
        nextVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        
        let baseUrl = "http://13.125.220.50:8080"
        
        AF.request("\(baseUrl)/auth/sign-in",
                   method: .post,
                   parameters: self.model.params,
                   encoding: JSONEncoding()
                   
        )
        .validate()
        .responseJSON { json in
            print(json)
        }
        .responseDecodable(of: TokenModel.self) { response in
            switch response.result {
            case .success(let data):
                viewController.present(nextVC, animated: true)
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
