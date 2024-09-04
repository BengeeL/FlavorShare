//
//  RecipeTile.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-29.
//

import SwiftUI
import Kingfisher

// MARK: RECIPE TILE SIZES ENUM
enum RecipeTileSizes {
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
            return UIScreen.main.bounds.width / 2
        case .large:
            return .infinity
        }
    }
}

struct RecipeTile: View {
    // MARK: VARIABLES
    //    @Binding var showRecipe: Bool
    let recipe: Recipe
    let size: RecipeTileSizes
    
    // MARK: BODY
    var body: some View {
        ZStack {
            // MARK: BACKGROUND IMAGE
            Image(recipe.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.dimension, height: size.dimension, alignment: .leading)
                .cornerRadius(25)
                .clipped()
                .shadow(radius: 3)
            
            // MARK: SHADOW OVERLAY
            LinearGradient(
                gradient: .init(
                    colors: [.black.opacity(1), .clear]
                ),
                startPoint: .bottom,
                endPoint: .top)
            .cornerRadius(25)
            .clipped()
            
            // MARK: RECIPE INFO
            VStack (spacing: 10){
                Spacer()
                
                // TITLE
                HStack {
                    Text(recipe.title)
                        .font(.subheadline)
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                    Spacer()
                }
                
                // STARS
                if let starsCount = recipe.stars {
                    StarComponent(numberOfStars: starsCount, size: .small)
                }
                
                // OVERVIEW
                HStack {
                    Text("\(recipe.cookTime) min.")
                    
                    if let calories = recipe.calories {
                        Text("\(calories) cal.")
                    }
                    
                    Spacer()
                } // HStack
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundStyle(Color("SubtittleColor"))
                
            } // VStack
            .padding(.bottom, 20)
            .padding(.horizontal, 20)
            
        } // ZStack
        .frame(width: size.dimension, height: size.dimension, alignment: .leading)
        .ignoresSafeArea(.all)
        .padding(3)
        
        .multilineTextAlignment(.leading)
        .shadow(radius: 3)
    }
}

#Preview {
    RecipeTile(recipe: DeveloperPreview.recipes[0], size: .large)
}
