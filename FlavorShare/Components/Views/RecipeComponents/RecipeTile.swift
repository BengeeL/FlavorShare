//
//  RecipeTile.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-29.
//

import SwiftUI
import Kingfisher

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
    
//    @Binding var showRecipe: Bool
    let recipe: Recipe
    let size: RecipeTileSizes
    
    var body: some View {
//        Button {
//            showRecipe.toggle()
//        } label : {
            ZStack {
                // BACKGROUND IMAGE
                Image(recipe.imageURL)
//                KFImage(URL(string: recipe.imageURL))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.dimension, height: size.dimension, alignment: .leading)
                    .cornerRadius(25)
                    .clipped()
                    .shadow(radius: 3)
                
                // SHADOW OVERLAY
                LinearGradient(
                    gradient: .init(
                        colors: [.black.opacity(1), .clear]
                    ),
                    startPoint: .bottom,
                    endPoint: .top)
                .cornerRadius(25)
                .clipped()
                
                // RECIPE INFO
                VStack (spacing: 10){
                    Spacer()
                    recipeTitle
                    if let starsCount = recipe.stars {
                        StarComponent(numberOfStars: starsCount, size: .small)
                    }
                    
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
//            .sheet(isPresented: $showRecipe, content: {
//                RecipeView(recipe: recipe)
//                    .presentationDragIndicator(.visible)
//            })
//        }
        .multilineTextAlignment(.leading)
        .shadow(radius: 3)
    }
    
    private var recipeTitle: some View {
        HStack {
            Text(recipe.title)
                .font(.subheadline)
                .fontWeight(.heavy)
                .foregroundStyle(.white)
            Spacer()
        }
    }
    
//    private var recipeStars: some View {
//        HStack (alignment: .center) {
//            let stars = recipe.stars ?? 0
//            if (stars > 0) {
//                ForEach(1...stars, id: \.self) { _ in
//                    Image(systemName: "star.fill")
//                        .resizable()
//                        .frame(width: 10, height: 10)
//                        .foregroundStyle(.customYellow)
//                }
//            }
//            if (stars < 5) {
//                ForEach(1...5 - stars, id: \.self) { _ in
//                    Image(systemName: "star")
//                        .resizable()
//                        .frame(width: 10, height: 10)
//                        .foregroundStyle(.customYellow)
//                }
//            }
//            Spacer()
//        }
//        .padding(.leading, 5)
//    }
        
//        HStack {
//            ForEach(1 ... (recipe.stars ?? 1), id: \.self) { _ in
//                Image("starIcon")
//                    .resizable()
//                    .foregroundStyle(.customYellow)
//                    .frame(width: 10, height: 10)
//            }
//            Spacer()
//        }
//        .padding(.leading, 5)
//    }
}

#Preview {
    RecipeTile(recipe: DeveloperPreview.recipes[0], size: .large)
}
