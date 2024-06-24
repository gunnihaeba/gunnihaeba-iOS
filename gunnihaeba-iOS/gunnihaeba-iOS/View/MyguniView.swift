//
//  MyguniView.swift
//  gunnihaeba-iOS
//
//  Created by bibiga on 6/17/24.
//

import SwiftUI

struct MyguniView: View {
    @StateObject var viewModel = MyIssueViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(0..<viewModel.model.data.count, id: \.self) { index in
                IssueCell(viewModel: viewModel, index: index) {
                    viewModel.deletePost(postId: viewModel.model.data[index].id)
                    viewModel.getLists()
                }
            }
        }
        .refreshable {
            await viewModel.getLists()
        }
        .onAppear {
            viewModel.getLists()
        }
    }
}

#Preview {
    NavigationView {
        MyguniView()
    }
}
