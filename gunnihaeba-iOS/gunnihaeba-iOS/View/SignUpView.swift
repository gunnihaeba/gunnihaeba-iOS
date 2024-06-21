//
//  SignUpView.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/21/24.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = SignUpViewModel()
    
    var body: some View {
        VStack(spacing: 50) {
            InputField(text: $viewModel.model.userId, placeholder: "아이디를 입력하세요")
            InputField(text: $viewModel.model.password, placeholder: "비밀번호를 입력하세요")
            InputField(text: $viewModel.model.name, placeholder: "이름을 입력하세요")
            
            Button {
                viewModel.signUp()
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 330, height: 50)
                    .overlay {
                        Text("회원가입")
                            .foregroundStyle(.white)
                    }
            }

        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    viewModel.signUp()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(.blue)
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        SignUpView()
    }
}
