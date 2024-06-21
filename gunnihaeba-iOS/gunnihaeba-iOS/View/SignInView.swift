//
//  SignInView.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/21/24.
//

import SwiftUI

struct SignInView: View {
    @StateObject var viewModel = SignInViewModel()
    
    var body: some View {
        VStack(spacing: 50) {
            InputField(text: $viewModel.model.userId, placeholder: "아이디를 입력해주세요")
            InputField(text: $viewModel.model.password, placeholder: "비밀번호를 입력해주세요")
            
            Button {
                viewModel.signin()
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 330, height: 50)
                    .overlay {
                        Text("로그인")
                            .foregroundStyle(.white)
                    }
            }
            
            NavigationLink(destination: SignUpView()) {
                Text("회원가입")
            }
        }
    }
}

#Preview {
    SignInView()
}
