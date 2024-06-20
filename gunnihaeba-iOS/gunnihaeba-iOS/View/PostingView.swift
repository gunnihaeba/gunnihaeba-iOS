//
//  PostingView.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/17/24.
//

import SwiftUI

struct PostingView: View {
    @Binding var title: String
    @Binding var content: String
    
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
                }
            
            ZStack(alignment: .topLeading) {
                TextEditor(text: $content)
                    .frame(width: 340, height: 400)
                    .font(.system(size: 20))
                    .lineSpacing(5)
                    .padding(.horizontal, 20)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 340, height: 400)
                            .foregroundStyle(Color(red: 220/255, green: 220/255, blue: 220/255))
                    }
                                
                if content.isEmpty {
                    Text("내용입력")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.gray)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 12)
                }
            }
            
            Button {
                
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
}

#Preview {
    PostingView(title: .constant(""), content: .constant(""))
}
