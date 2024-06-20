//
//  PostDetailView.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/17/24.
//

import SwiftUI

struct PostDetailView: View {
    @StateObject var viewModel = PostDetailViewModel()
    
    @State var isLike: Bool = false
    @State var isHate: Bool = false
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(Color(red: 220/255, green: 220/255, blue: 220/255))
                .frame(width: 340, height: 60)
                .overlay {
                    HStack {
                        Text(viewModel.model.title)
                        
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
                            Text("작성자: \(viewModel.model.writer)")
                            Text("작성일: \(viewModel.model.createdDate)")
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
                            Text(viewModel.model.content)
                            
                            Spacer()
                        }
                        
                        Spacer()
                    }
                    .padding()
                }
            
            HStack {
                Button {
                    if isLike {
                        viewModel.model.like -= 1
                    } else {
                        viewModel.model.like += 1
                    }
                    self.isLike.toggle()
                } label: {
                    Circle()
                        .frame(width: 80, height: 80)
                        .foregroundStyle(isLike ? .blue : Color(red: 220/255, green: 220/255, blue: 220/255))
                        .overlay {
                            VStack {
                                Image(systemName: "hand.thumbsup")
                                
                                Text("\(viewModel.model.like)")
                            }
                            .font(.system(size: 20, weight: .bold))
                        }
                }
                
                Spacer()
                
                Button {
                    if isHate {
                        viewModel.model.hate -= 1
                    } else {
                        viewModel.model.hate += 1
                    }
                    self.isHate.toggle()
                } label: {
                    Circle()
                        .frame(width: 80, height: 80)
                        .foregroundStyle(isHate ? .blue : Color(red: 220/255, green: 220/255, blue: 220/255))
                        .overlay {
                            VStack {
                                Image(systemName: "hand.thumbsdown")
                                
                                Text("\(viewModel.model.hate)")
                            }
                            .font(.system(size: 20, weight: .bold))
                        }
                }
            }
            .foregroundStyle(.black)
            .padding(.horizontal, 30)
            
            Spacer()
        }
        .font(.system(size: 20, weight: .bold))
    }
}

#Preview {
    PostDetailView()
}
