//
//  issueCell.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/22/24.
//

import SwiftUI

struct IssueCell: View {
    let viewModel: MyIssueViewModel
    let index: Int
    let action: () -> Void
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 340, height: 60)
            .foregroundStyle(Color(red: 220/255, green: 220/255, blue: 220/255))
            .overlay {
                HStack {
                    VStack {
                        Text(viewModel.model.data[index].title)
                        Text(viewModel.model.data[index].date)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: MyguniEditView(postId: viewModel.model.data[index].id)) {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.blue)
                            .overlay {
                                Text("수정")
                                    .foregroundStyle(.white)
                            }
                    }
                
                    
                    Button { 
                        action()
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 50, height: 50)
                            .foregroundStyle(.blue)
                            .overlay {
                                Text("삭제")
                                    .foregroundStyle(.white)
                            }
                    }
                }
                .padding(.horizontal)
            }
    }
}

#Preview {
    IssueCell(viewModel: .init(), index: 0) {
        
    }
}
