//
//  NutritionTile.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-22.
//

import SwiftUI

enum NutritionTileSizes {
    case xSmall
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
        case .xSmall:
            return UIScreen.main.bounds.width / 3.5
        case .small:
            return UIScreen.main.bounds.width / 3
        case .medium:
            return UIScreen.main.bounds.width / 2.5
        case .large:
            return .infinity
        }
    }
}

struct NutritionTileView: View {
    
    let progress: CGFloat
    let title: String
    let size: NutritionTileSizes
    let isPercentage: Bool
    let color: Color?

    init (progress: CGFloat, title: String, size: NutritionTileSizes, isPercentage: Bool) {
        self.progress = progress
        self.title = title
        self.size = size
        self.isPercentage = isPercentage
        self.color = nil
    }
    
    init (progress: CGFloat, title: String, size: NutritionTileSizes, isPercentage: Bool, color: Color) {
        self.progress = progress
        self.title = title
        self.size = size
        self.isPercentage = isPercentage
        self.color = color
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.tile)
                .cornerRadius(25)
                .shadow(radius: 3)

            VStack {
                Text(title)
                    .font(.title2)
                    .foregroundStyle(.title)
                
                ZStack {
                    CircleGraph(progress: progress, title: title, color: color)
                        .padding(.horizontal)
                        .padding(.bottom)
                    
                    if (size != .small || size != .xSmall) {
                        if (isPercentage) {
                            Text("\(Int(progress * 100))%")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundStyle(.title)
                                .padding(.bottom)

                        } else {
                            let exempleValue = 2000
                            let exempleProgress = 2000 * progress
                            
                            HStack (spacing: 3) {
                                Text("\(Int(exempleProgress))")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .padding(.bottom, 35)
                                    .foregroundStyle(.title)
                                
                                Text("/")
                                    .font(.body)
                                    .padding(.top)
                                    .padding(.bottom, 50)
                                    .foregroundStyle(.title)
                            }
                            
                            // TODO: Change prefix for adequat mesurement (g)
                            Text("\(exempleValue) \(title.prefix(3).lowercased())")
                                .font(.body)
                                .padding(.top)
                                .foregroundStyle(.title)
                        }
                    }
                }
            }
        }
        .frame(width: size.dimension, height: size.dimension + (size.dimension / 3))
        .padding(3)
    }
}

#Preview {
    NutritionTileView(progress: 0.9, title: "Calories", size: .medium, isPercentage: false)
}
