//
//  RemoteAuthService.swift
//  babya
//
//  Created by dgsw8th61 on 5/18/24.
//  Copyright © 2024 kr.hs.dgsw.dongbao. All rights reserved.
//

import Foundation
import Alamofire
import SwiftUI

final class RemoteAuthService: AuthService {
    
    let baseUrl = "http://13.125.220.50:8080"
    
    func login(email: String, password: String) async throws -> Response<LoginResponse> {
        
        let loginRequest = LoginRequest(userId: email, password: password)
        let loginUrl = "/auth/sign-in"
        
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(baseUrl + loginUrl, method: .post, parameters: loginRequest, encoder: JSONParameterEncoder.default)
                .responseJSON { json in
                    print(json)
                }
                .responseDecodable(of: Response<LoginResponse>.self) { response in
                    switch response.result {
                    case .success(let responseData):
                        continuation.resume(returning: responseData)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
}
