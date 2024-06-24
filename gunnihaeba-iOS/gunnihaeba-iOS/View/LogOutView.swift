//
//  LogOutView.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/22/24.
//

import SwiftUI

struct LogOutView: View {
    var body: some View {
        Button {
            LoginUserHashCache.shared.logout()
            
            withAnimation {
                DispatchQueue.main.async {
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                    let window = windowScene.windows.first {
                        window.rootViewController = UIHostingController(rootView: NavigationView {
                            SignInView(viewModel: SignInViewModel(authService: RemoteAuthService()))
                        })
                        window.makeKeyAndVisible()
                    }
                }
            }
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 150, height: 150)
                .overlay {
                    Text("로그아웃")
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .bold))
                }
        }
    }
}

#Preview {
    LogOutView()
}
