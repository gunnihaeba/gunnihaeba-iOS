//
//  PostDetailView.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/17/24.
//

import SwiftUI

struct PostDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = PostDetailViewModel()
    
    @State var isLike: Bool = false
    @State var isHate: Bool = false
    
    @FocusState private var isFocused: Bool
    
    let postId: Int
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color(red: 220/255, green: 220/255, blue: 220/255))
                        .frame(width: 340, height: 60)
                        .overlay {
                            HStack {
                                Text(viewModel.model.data.title)
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color(red: 220/255, green: 220/255, blue: 220/255))
                        .frame(width: 340, height: 100)
                        .overlay {
                            HStack {
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("작성자: \(viewModel.model.data.writer)")
                                    Text("작성일: \(viewModel.model.data.date)")
                                }
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color(red: 220/255, green: 220/255, blue: 220/255))
                        .frame(width: 340, height: 350)
                        .overlay {
                            VStack {
                                HStack(alignment: .top) {
                                    Text(viewModel.model.data.content)
                                    
                                    Spacer()
                                }
                                
                                Spacer()
                            }
                            .padding()
                        }
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.gray)
                    
                    ForEach(0..<viewModel.commentResponse.data.count, id: \.self) { index in
                        CommentCell(content: viewModel.commentResponse.data[index].content, writer: viewModel.commentResponse.data[index].writer, date: viewModel.commentResponse.data[index].date)
                    }
                    
                }
                .font(.system(size: 20, weight: .bold))
            }
            .onAppear {
                viewModel.getPostDetail(postId: postId)
                viewModel.getComment(postId: postId)
            }
            
            HStack(spacing: 0) {
                TextField("댓글 쓰기", text: $viewModel.commentModel.content)
                    .frame(height: 45)
                    .focused($isFocused)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10).stroke(.blue, lineWidth: 1)
                    }
                
                Button {
                    isFocused = false
                    viewModel.postComment(postId: postId)
                    viewModel.commentModel.content = ""
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                        .overlay {
                            Image(systemName: "paperplane")
                                .foregroundColor(.white)
                        }
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        PostDetailView(postId: 1)
    }
}
