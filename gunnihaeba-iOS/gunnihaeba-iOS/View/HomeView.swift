//
//  HomeView.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/17/24.
//

import SwiftUI
import Alamofire

struct ApiResponse: Codable {
    let status: Int
    let message: String
    let data: [Post]
}

struct Post: Identifiable, Codable {
    let id: Int
    let title: String
    let date: String
}


class ViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    func fetchPosts(page: Int, size: Int) {
        let url = "http://13.125.220.50:8080/issue/list"
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer eyJKV1QiOiJBQ0NFU1MiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1c2VyMSIsImlhdCI6MTcxODkzNjU1OSwiZXhwIjoxNzE5MDIyOTU5fQ._iwkEenq4C9oKu0XjtS2Lew11W6WfBuKeBFfuaMh1nw"
        ]
        
        let parameters: [String: Any] = [
            "page": page,
            "size": size
        ]
        
        AF.request(url, method: .get, parameters: parameters, headers: headers)
            .validate()
            .responseDecodable(of: ApiResponse.self) { response in
                switch response.result {
                case .success(let apiResponse):
                    DispatchQueue.main.async {
                        let posts = apiResponse.data.map { post in
                            Post(id: post.id, title: post.title, date: post.date)
                        }
                        self.posts = posts
                        print("Successfully fetched posts: \(self.posts)")
                    }
                case .failure(let error):
                    print("Error fetching posts: \(error)")
                    if let data = response.data,
                       let errorMessage = String(data: data, encoding: .utf8) {
                        print("Server error message: \(errorMessage)")
                    }
                }
            }
        
    }
}

struct HomeView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.posts) { post in
                        PostsCell(post: post)
                    }
                    .padding()
                }
                .padding(.vertical)
            }
            .onAppear {
                viewModel.fetchPosts(page: 1, size: 10)
            }
        }
    }
}

struct PostsCell: View {
    let post: Post
    
    var body: some View {
        NavigationLink(destination: Text(post.title)) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 340, height: 80)
                .foregroundStyle(Color(red: 220/255, green: 220/255, blue: 220/255))
                .overlay {
                    HStack {
                        Text(post.title)
                            .font(.system(size: 25, weight: .bold))
                        
                        Spacer()
                        
                        Text(post.date)
                            .font(.system(size: 20))
                    }
                    .padding(.horizontal, 20)
                }
        }
        .tint(.black)
    }
}

#Preview {
    HomeView()
}
