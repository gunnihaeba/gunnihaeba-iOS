//
//  gunnihaeba_iOSApp.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/20/24.
//

import SwiftUI

@main
struct gunnihaeba_iOSApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if (LoginUserHashCache.shared.checkAccessToken() != nil) {
                    ContentView()
                } else {
                    SignInView(viewModel: SignInViewModel(authService: RemoteAuthService()))
                }
            }
        }
    }
}
