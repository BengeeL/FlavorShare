//
//  LargeTitle.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-13.
//

import SwiftUI

struct LargeTitle: View {
    // MARK: VARIABLES
    let title: String
    
    
    // MARK: BODY
    var body: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundStyle(Color("TitleColor"))
            .padding(.leading, -4)
    }
}

#Preview {
    LargeTitle(title: "Title")
}
