//
//  ContentView.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/17/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("건의 리스트")
                }
            
            PostingView(title: "", content: "")
                .tabItem {
                    Image(systemName: "pencil")
                    Text("건의하기")
                }
            
            MyguniView()
                .tabItem {
                    Image(systemName: "person")
                    Text("나의 건의")
                }
            
            LogOutView()
                .tabItem {
                    Image(systemName: "door.right.hand.open")
                    Text("로그아웃")
                }
        }
    }
}

#Preview {
    ContentView()
}
