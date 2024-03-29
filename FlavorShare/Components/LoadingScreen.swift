//
//  LoadingScreen.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-14.
//

import SwiftUI

struct LoadingScreen: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .opacity(0.7)
                .foregroundStyle(.tile)
            
            Text("Loading...")
                .fontWeight(.heavy)
                .font(.largeTitle)
                .foregroundStyle(Color("SubtittleColor"))
                .multilineTextAlignment(.center)
                .padding(.top, 2.0)
                .padding(.leading, 2.0)
            
            Text("Loading...")
                .fontWeight(.heavy)
                .font(.largeTitle)
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
    LoadingScreen()
}
