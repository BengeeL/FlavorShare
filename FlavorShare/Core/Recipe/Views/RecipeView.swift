//
//  RecipePage.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-29.
//

import SwiftUI

struct RecipeView: View {
    
    let recipe: Recipe
    
    var body: some View {
        
        // MARK: TODO
        // TODO: ADD COOKING MODE WITH INSTRUCTION FULL SCREEN (MEALIME)
        // TODO: ADD SHARING OPTION
        // TODO: ADD RATING OPTION
        // TODO: ADD "ADD TO YOUR WEEK BUTTON"
        // TODO: RECIPE NUTRITION VALUES
        // TODO: ADD DOLLARD APPROXIMATIF FOR RECIPE
        // TODO: ADD EDIT OPTION FOR CREATOR
        
        ScrollView {
            VStack(spacing: 0) {
                // MARK: - RECIPE HEADER (IMAGE)
                // IMAGE BACKGROUND
                ZStack {
                    VStack {
                        Image(recipe.imageURL)
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                            .clipped()
                            .ignoresSafeArea(.all)
                        Spacer()
                    }
                    
                    VStack {
                        LinearGradient(
                            gradient: .init(
                                colors: [.black, .clear, .clear]
                            ),
                            startPoint: .top,
                            endPoint: .bottom)
                        .frame(height: UIScreen.main.bounds.height / 7)
                        .ignoresSafeArea(.all)
                        Spacer()
                    }
                }
                
                // MARK: - RECIPE INFO
                VStack (alignment: .leading) {
                    // MARK: TITLE
                    LargeTitle(title: recipe.title)
                        .padding(.bottom, 10)
                        .padding(.top, 55)
                    
                    // MARK: RECIPE CALORIES/COOK TIME
                    HStack (spacing: 10){
                        Text("\(recipe.cookTime) Minutes")
                            .font(.subheadline)
                            .fontWeight(.heavy)
                            .foregroundStyle(Color("SubtittleColor"))
                        
                        if let calories = recipe.calories {
                            Text("\(calories) Calories")
                                .font(.subheadline)
                                .fontWeight(.heavy)
                                .foregroundStyle(Color("SubtittleColor"))
                        }
                        
                        Spacer()
                    }
                    
                    // MARK: RECIPE STARS
                    if let starsCount = recipe.stars {
                        StarComponent(numberOfStars: starsCount, size: .medium)
                            .padding(.vertical, 5)
                    }
                    
                    // MARK: RECIPE DESCRIPTION
                    Text(recipe.description)
                        .foregroundStyle(Color("TextColor"))
                        .padding(.vertical, 10)
                    
                    // MARK: RECIPE INGREDIENTS
                    Text("Ingredients")
                        .font(.title)
                        .padding(.top, 20)
                        .foregroundStyle(Color("TitleColor"))
                    
                    ScrollView (.horizontal) {
                        LazyHStack {
                            ForEach(recipe.ingredients) { ingredient in
                                IngredientTile(ingredient: ingredient)
                            }
                            Spacer()
                        }
                    }
                    
                    // MARK: RECIPE INSTRUCTIONS
                    Text("Instructions")
                        .font(.title)
                        .padding(.top, 20)
                        .foregroundStyle(Color("TitleColor"))

                    LazyVStack(alignment: .leading, spacing: 20) {
                        ForEach(recipe.instructions) { instruction in
                            HStack (alignment: .top) {
                                Text("\(instruction.stepNumber)")
                                    .font(.headline)
                                    .foregroundStyle(Color("TextColor"))
                                    .frame(width: 20, alignment: .leading)
                                
                                Text(instruction.stepDescription)
                                    .foregroundStyle(Color("TextColor"))
                            }
                        }
                    }
                    .padding(.bottom, 40)
                    
                    Spacer()
                } // VStack
                .background(
                    RoundedRectangle(cornerRadius: 40.0)
                        .fill(Color("BackgroundColor"))
                        .frame(width: UIScreen.main.bounds.width)
                )
                .padding(.horizontal)
                .padding(.top, -100)
            } // VStack
        } // ScrollView
        .multilineTextAlignment(.leading)
    } // Body
}

#Preview {
    RecipeView(recipe: DeveloperPreview.recipes[0])
}
