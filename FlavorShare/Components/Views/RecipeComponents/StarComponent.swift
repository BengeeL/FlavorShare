//
//  StarComponent.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-28.
//

import SwiftUI

struct StarComponent: View {
    // MARK: VARIABLES
    let numberOfStars: Int
    let size: Image.Scale
    
    // MARK: BODY
    var body: some View {
        HStack (alignment: .center) {
            let stars = numberOfStars
            if (stars > 0) {
                ForEach(1...stars, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .imageScale(size)
                        .foregroundStyle(.customYellow)
                }
            }
            if (stars < 5) {
                ForEach(1...5 - stars, id: \.self) { _ in
                    Image(systemName: "star")
                        .imageScale(size)
                        .foregroundStyle(.customYellow)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    StarComponent(numberOfStars: 5, size: .large)
}
