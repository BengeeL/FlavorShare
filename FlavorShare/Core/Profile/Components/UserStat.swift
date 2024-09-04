//
//  UserStats.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-11.
//

import SwiftUI

struct UserStat: View {
    // MARK: VARIABLES
    let value: Int?
    let title: String
    
    // MARK: BODY
    var body: some View {
        Text("\(value ?? 0)")
            .font(.body)
            .fontWeight(.heavy)
            .foregroundStyle(Color("TitleColor"))
            .opacity(value == 0 || value == nil ? 0.5 : 1)
        
        Text(title)
            .font(.subheadline)
            .foregroundStyle(Color("SubtittleColor"))
            .padding(.bottom, 5)
        
    }
}

#Preview {
    UserStat(value: 0, title: "Title")
}
