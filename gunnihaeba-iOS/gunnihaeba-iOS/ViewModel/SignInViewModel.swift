//
//  SignInViewModel.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/21/24.
//

import Foundation
import Alamofire
import Combine
import SwiftUI

@MainActor
class SignInViewModel: ObservableObject {
    @Published var is401Error: Bool = false
    @Published var is404Error: Bool = false
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String? = nil
    
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func login(email: String, password: String) async {
        do {
            let response = try await authService.login(email: email, password: password)
            
            print(response.message)
            switch response.status {
            case 200:
                isLoggedIn = true
                LoginUserHashCache.shared.storeAccessToken(value: response.data?.accessToken ?? "")
                LoginUserHashCache.shared.storeRefreshToken(value: response.data?.refreshToken ?? "")
                
                print(LoginUserHashCache.accessToken)
                print(LoginUserHashCache.shared.checkAccessToken())
                
                DispatchQueue.main.async {
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let rootViewController = windowScene.windows.first?.rootViewController {
                        let homeView = UIHostingController(rootView: NavigationView { ContentView() })
                        homeView.modalPresentationStyle = .fullScreen
                        rootViewController.present(homeView, animated: true, completion: nil)
                    }
                }
              
            case 401:
                is401Error = true
                errorMessage = "Unauthorized: Incorrect email or password."
            case 404:
                is404Error = true
                errorMessage = "Server not found. Please check the URL."
            default:
                errorMessage = "An unknown error occurred."
            }
        } catch {
            errorMessage = "Network error: \(error.localizedDescription)"
        }
    }
}

