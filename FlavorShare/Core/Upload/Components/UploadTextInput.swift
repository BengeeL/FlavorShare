//
//  UploadTextInput.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-29.
//

import SwiftUI

struct UploadTextInput: View {
    // MARK: VARIABLES
    @State var placehorder: String
    @Binding var text: String
    
    // MARK: BODY
    var body: some View {
        TextField(placehorder, text: $text, axis: .vertical)
            .padding()
            .multilineTextAlignment(.leading)
            .lineLimit(10)
            .foregroundStyle(.text)
            .background(.tile)
            .cornerRadius(25)
            .shadow(radius: 3)
    }
}

#Preview {
    UploadTextInput(placehorder: "Post Caption", text: .constant(""))
}
