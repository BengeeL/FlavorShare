//
//  RecipeSliderView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-28.
//

import SwiftUI

struct RecipeSliderView: View {
    
    @State var title: String
    @State var recipes: [Recipe]
    @State private var showMore = false
    @State private var selectedRecipe: Recipe? = nil
    @State private var showRecipe = false
    
    private var recipeToDisplay: [Recipe] {
        if (recipes.count > 5) {
            return Array(recipes.prefix(5))
        } else {
            return recipes
        }
    }
    
    private func padding(recipe: Recipe) -> Edge.Set? {
        if (recipeToDisplay.count == 0) {
            return nil
        }
        
        if (recipe.id == recipeToDisplay[0].id) {
            return .leading
        } else if (recipe.id == recipeToDisplay[recipeToDisplay.count - 1].id) {
            return .trailing
        }
        
        return nil
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                Text(title)
                    .font(.title)
                    .foregroundStyle(Color("TitleColor"))
                Spacer()
                Button(action: {
                    // TODO: Open new full
                    print("See More Clicked!")
                }, label: {
                    Text("See more")
                        .font(.subheadline)
                        .foregroundStyle(.customBlue)
                })
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(recipeToDisplay) { recipe in
                        RecipeTile(recipe: recipe, size: .medium)
                            .onTapGesture {
                                self.selectedRecipe = recipe
                            }
                            .padding(padding(recipe: recipe) ?? .all, padding(recipe: recipe) != nil ? 20 : 0)
                    }
                }
            }
        }
        .sheet(item: $selectedRecipe) { recipe in
            RecipeView(recipe: recipe)
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    RecipeSliderView(title: "Upcoming Meals", recipes: DeveloperPreview.recipes)
}
