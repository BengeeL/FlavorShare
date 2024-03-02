//
//  IngredientTile.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-29.
//

import SwiftUI

struct IngredientTile: View {
    
    let img: String
    let ingredientName: String
    let ingredientGrams: Int
    
    var body: some View {
        ZStack {
            imageIngredient
            shadowOverlay
            ingredientInfo
        }
        .frame(width: 200, height: 200)
        .cornerRadius(25)
    }
    
    private var imageIngredient: some View {
        Image(img)
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .clipped() 
    }
    
    private var shadowOverlay: some View {
        LinearGradient(
            gradient: .init(
                colors: [.black.opacity(1), .clear, .clear]
            ),
            startPoint: .bottom,
            endPoint: .top)
    }
    
    private var ingredientInfo: some View {
        VStack {
            Spacer()
            
            Text(ingredientName)
                .font(.title2)
                .foregroundColor(.white)
                .fontWeight(.heavy)
                .frame(width: 150, alignment: .leading)

            Text(String(format: "%u Grams", ingredientGrams))
                .font(.subheadline)
                .foregroundColor(Color("SubtittleColor"))
                .fontWeight(.bold)
                .frame(width: 150, alignment: .leading)
        }
        .padding(.bottom, 30)
    }
}

#Preview {
    IngredientTile(img: "IngredientExample", ingredientName: "Cauliflower", ingredientGrams: 1000)
}
