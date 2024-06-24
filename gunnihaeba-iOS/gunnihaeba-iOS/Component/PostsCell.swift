//
//  PostsCell.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/22/24.
//

import SwiftUI

struct PostsCell: View {
    let model: PostListModel
    let index: Int
    
    var body: some View {
        NavigationLink(destination: PostDetailView(postId: model.data[index].id)) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 340, height: 60)
                .foregroundStyle(Color(red: 220/255, green: 220/255, blue: 220/255))
                .overlay {
                    HStack {
                        Text(model.data[index].title)
                            .font(.system(size: 15))
                        
                        Spacer()
                        
                        Text(model.data[index].date)
                            .font(.system(size: 13))
                        
                        Image(systemName: "chevron.right")
                    }
                    .padding(.horizontal, 20)
                }
        }
        .tint(.black)
    }
}
