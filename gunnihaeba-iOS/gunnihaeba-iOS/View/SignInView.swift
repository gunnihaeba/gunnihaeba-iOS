//
//  SignInView.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/21/24.
//

import SwiftUI

struct SignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    @StateObject var viewModel: SignInViewModel
    
    var body: some View {
        VStack(spacing: 50) {
            Text("건의해봐")
                .font(.system(size: 20, weight: .bold))
                .padding(.vertical, 50)
            
            InputField(text: $email, placeholder: "아이디를 입력해주세요")
            InputField(text: $password, placeholder: "비밀번호를 입력해주세요")
            
            Button {
                Task{
                     await viewModel.login(email: email,password:password)
                }
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
