//
//  HomeView.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/17/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView(showsIndicators: true) {
            PostsCell()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("건의해봐")
                    .font(.system(size: 30, weight: .bold))
            }
        }
    }
}

#Preview {
    HomeView()
}
