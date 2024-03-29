//
//  EditFieldSetting.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-15.
//

import SwiftUI

struct EditFieldSetting: View {
    
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .padding(.leading, 10)
                    .frame(width: 100, alignment: .leading)
                
                VStack {
                    TextField(placeholder, text: $text)
                }
            }
            .font(.subheadline)
            .frame(height: 36)
            
            Divider()
        }
    }
}

#Preview {
    EditFieldSetting(title: "Name", placeholder: "Full Name", text: .constant(""))
}
