//
//  LogoTitle.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-01.
//

import SwiftUI

struct LogoTitle: View {
    var body: some View {
        ZStack {
            Text("FlavorShare")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .foregroundStyle(Color("SubtittleColor"))
                .multilineTextAlignment(.center)
                .padding(.top, 2.0)
                .padding(.leading, 2.0)
            
            Text("FlavorShare")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .foregroundStyle(
                    LinearGradient(
                        gradient: Gradient(colors: [.customBlue, .customGreen]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
        }
    }
}

#Preview {
    LogoTitle()
}
