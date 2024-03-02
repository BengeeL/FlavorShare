//
//  RecipePage.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-29.
//

import SwiftUI

struct RecipeView: View {
    
    let img: String
    let recipeName: String
    let description: String
    let stars: Int
    let minutes: Int
    let calories: Int
    let steps: [String]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                imageRecipe
                tile
                    .padding(.top, -UIScreen.main.bounds.height/4)
            }
        }
        .ignoresSafeArea(.all)
    }
    
    private var imageRecipe: some View {
        ZStack {
            backgroundIMG
            shadowOverlay
        }
    }
    
    private var backgroundIMG: some View {
        VStack {
            Image(img)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: UIScreen.main.bounds.height / 2)
                .clipped()
                .ignoresSafeArea(.all)
            Spacer()
        }
    }
    
    private var shadowOverlay: some View {
        VStack {
            LinearGradient(
                gradient: .init(
                    colors: [.black.opacity(1), .clear, .clear]
                ),
                startPoint: .top,
                endPoint: .bottom)
                .frame(height: UIScreen.main.bounds.height / 6)
                .ignoresSafeArea(.all)
            Spacer()
        }
    }
    
    private var tile: some View {
        ScrollView {
            ZStack {
                tileBackground
                recipeInfo
            }
        }
        .frame(height: .infinity)
    }
    
    private var tileBackground: some View {
        RoundedRectangle(cornerRadius: 40.0)
            .fill(Color("BackgroundColor"))
            .frame(width: .infinity, height: .infinity)
            .ignoresSafeArea(.all)
    }
    
    private var recipeInfo: some View {
        VStack {
            recipeTitle
            recipeSubtitle
            recipeStars
            recipeNutrition
            recipeDescription
            recipeIngredients
            recipeSteps
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 50)
    }
    
    private var recipeTitle: some View {
        Text(recipeName)
            .font(.title)
            .foregroundColor(Color("TitleColor"))
            .frame(width: UIScreen.main.bounds.width - 60, alignment: .leading)
            .padding(.bottom, 10)
    }
    
    private var recipeStars: some View {
        HStack {
            ForEach(1...stars, id: \.self) { _ in
                starIcon
            }
            Spacer()
        }
    }
    
    private var starIcon: some View {
        Image("starIcon")
            .resizable()
            .foregroundColor(.customYellow)
            .frame(width: 15, height: 15)
    }
    
    private var recipeSubtitle: some View {
        HStack (spacing: 10){
            recipeTime
            recipeCalories
            Spacer()
        }
    }
    
    private var recipeTime: some View {
        Text("\(minutes) Min.")
            .font(.subheadline)
            .fontWeight(.heavy)
            .foregroundColor(Color("SubtittleColor"))
    }
    
    private var recipeCalories: some View {
        Text("\(calories) Calories")
            .font(.subheadline)
            .fontWeight(.heavy)
            .foregroundColor(Color("SubtittleColor"))
    }
    
    private var recipeNutrition: some View {
        VStack{
            
        }
    }
    
    private var recipeDescription: some View {
        Text(description)
            .foregroundColor(Color("TextColor"))
            .frame(width: UIScreen.main.bounds.width - 60, alignment: .leading)
            .padding(.vertical, 20)

    }
    
    private var recipeIngredients: some View {
        ScrollView (.horizontal) {
            HStack {
                ForEach(1...stars, id: \.self) { _ in
                    IngredientTile(img: "IngredientExample", ingredientName: "Carrot", ingredientGrams: 200)
                }
                Spacer()
            }
        }
    }
    
    private var recipeSteps: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(1...steps.count, id: \.self) { stepIndex in
                stepsDescription(for: stepIndex)
            }
            Spacer()
        }
        .padding(.vertical, 30)
    }

    private func stepsDescription(for stepIndex: Int) -> some View {
        HStack(alignment: .top) {
            Text("\(stepIndex)")
                .font(.headline)
                .foregroundColor(Color("TextColor"))
                .frame(width: 20, alignment: .leading)
            
            Text(steps[stepIndex - 1])
                .foregroundColor(Color("TextColor"))
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    RecipeView(img: "welcomeViewBackground", recipeName: "Recipe Name", description: "This is a long text description allowing to have a visual on the recipe's page design.", stars: 4, minutes: 30, calories: 560, steps: ["Preheat over", "Cut Carrots", "This is a long text description allowing to have a visual on the recipe's page design."])
}
