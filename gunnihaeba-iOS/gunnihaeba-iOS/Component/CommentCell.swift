//
//  CommentCell.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/22/24.
//

import SwiftUI

struct CommentCell: View {
    let content: String
    let writer: String
    let date: String
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(writer)
                        .font(.system(size: 12))
                    
                    Text(content)
                        .font(.system(size: 20))
                }
                
                Spacer()
                
                Text(date)
                    .font(.system(size: 15))
            }
            .padding(.horizontal, 20)
            
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    CommentCell(content: "그래그래", writer: "이승혁", date: "2024-06-22")
}
