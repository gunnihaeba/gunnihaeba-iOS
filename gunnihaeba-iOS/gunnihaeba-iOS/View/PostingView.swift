//
//  PostingView.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/17/24.
//

import SwiftUI
import Alamofire

struct PostingView: View {
    @State var title: String
    @State var content: String
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color(red: 220/255, green: 220/255, blue: 220/255))
                .frame(width: 340, height: 60)
                .overlay {
                    TextField(text: $title, prompt: Text("제목").font(.system(size: 20, weight: .bold))) {
                    }
                    .padding(.horizontal)
                    .textInputAutocapitalization(.never)
                    .focused($isFocused)
                }
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 340, height: 400)
                .foregroundStyle(Color(red: 220/255, green: 220/255, blue: 220/255))
                .overlay {
                    VStack {
                        TextField("", text: $content, prompt: Text("ex) 박소진이 일을 못해요"))
                            .frame(width: 320, height: 400)
                            .font(.system(size: 20))
                            .lineSpacing(5)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                        
                        Spacer()
                    }
                }
            
            Button {
                isFocused = false
                submitPost(title: title, content: content)
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 340, height: 60)
                    .foregroundStyle(.blue)
                    .overlay {
                        Text("건의하기")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.white)
                    }
            }
            .padding(.vertical)
            
            Spacer()
        }
    }
    func submitPost(title: String, content: String) {
            let parameters: [String: Any] = [
                "title": title,
                "content": content
            ]

            let url = "http://13.125.220.50:8080/issue"

            AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [.authorization(bearerToken: LoginUserHashCache.shared.checkAccessToken() ?? LoginUserHashCache.accessToken)])
                .responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        print("작성 성공: \(value)")
                    case .failure(let error):
                        print("작성 실패: \(error)")
                    }
                }
        }
}

#Preview {
    PostingView(title: "", content: "")
}
