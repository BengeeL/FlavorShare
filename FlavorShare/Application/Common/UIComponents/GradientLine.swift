//
//  GradientLine.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-29.
//

import SwiftUI

struct GradientLine: View {
    
    let primaryColor: Color
    let secondaryColor: Color
    
    var body: some View {
        gradiantLine
    }
    
    private var gradiantLine: some View {
        Rectangle()
            .fill(LinearGradient(gradient: .init(colors: [primaryColor, secondaryColor]), startPoint: .leading, endPoint: .trailing))
            .frame(height: 5)
            .padding(.bottom, 10)
    }
}

#Preview {
    GradientLine(primaryColor: .customBlue, secondaryColor: .customGreen)
}
