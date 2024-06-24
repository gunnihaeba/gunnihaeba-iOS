//
//  HomeView.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/17/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = PostListViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(0..<viewModel.model.data.count, id: \.self) { index in
                    PostsCell(model: viewModel.model, index: index)
                }
            }
        }
        .onAppear {
            viewModel.fetchPosts(page: 1, size: 10)
        }
    }
}

#Preview {
    HomeView()
}
