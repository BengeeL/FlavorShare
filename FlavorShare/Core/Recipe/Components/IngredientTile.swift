//
//  IngredientTile.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-29.
//

import SwiftUI

struct IngredientTile: View {
    // MARK: VARIABLES
    let ingredient: Ingredient

    // MARK: BODY 
    var body: some View {
        VStack (alignment: .leading){
            Spacer()
            
            Text(ingredient.name)
                .font(.title2)
                .foregroundStyle(.white)
                .fontWeight(.heavy)
                .frame(width: 130, alignment: .leading)
                .shadow(radius: 3)

            Text("\(200) Grams")
                .font(.subheadline)
                .foregroundStyle(Color("SubtittleColor"))
                .fontWeight(.bold)
                .padding(.bottom, 20)
                .frame(width: 130, alignment: .leading)
                .shadow(radius: 3)

        }
        .background(
            ZStack (alignment: .bottomLeading){
                Image(ingredient.imageURL)
                    .resizable()
                    .scaledToFill()
                
                LinearGradient(
                    gradient: .init(
                        colors: [.black.opacity(1), .clear, .clear]
                    ),
                    startPoint: .bottom,
                    endPoint: .top)
            }
        )
        .frame(width: 150, height: 150)
        .cornerRadius(25)
        .clipped()
        .shadow(radius: 3)
        .padding(3)
    }
}

#Preview {
    IngredientTile(ingredient: DeveloperPreview.ingredients[0])
}
