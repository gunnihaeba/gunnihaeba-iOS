//
//  InputField.swift
//  gunnihaeba-iOS
//
//  Created by hyk on 6/21/24.
//

import Foundation
import SwiftUI

struct InputField: View {
    @Binding var text: String
    let placeholder: String

    var body: some View {
        VStack {
            TextField("", text: $text, prompt: Text(placeholder))
            .padding(.horizontal, 35)
            .textInputAutocapitalization(.never)
            
            Rectangle()
                .frame(width: 330, height: 1)
                .foregroundStyle(.gray)

        }
    }
}

#Preview {
    InputField(text: .constant(""), placeholder: "")
}
