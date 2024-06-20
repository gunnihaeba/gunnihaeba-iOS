//
//  PostsCell.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/17/24.
//

import SwiftUI

struct PostsCell: View {
    @StateObject var viewModel = PostDetailViewModel()
    
    var body: some View {
        NavigationLink {
            PostDetailView()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 340, height: 80)
                .foregroundStyle(Color(red: 220/255, green: 220/255, blue: 220/255))
                .overlay {
                    HStack {
                        Text(viewModel.model.title)
                            .font(.system(size: 25, weight: .bold))
                        
                        Spacer()
                        
                        Text(viewModel.model.createdDate)
                            .font(.system(size: 20))
                    }
                    .padding(.horizontal, 20)
                }
        }
        .tint(.black)
    }
}

#Preview {
    NavigationView {
        PostsCell()
    }
}
