//
//  HomeView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-29.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack (spacing: 30) {
                        HStack {
                            Text("Hello, \("Benjamin")!")
                                .font(.title)
                                .foregroundStyle(Color("TitleColor"))
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        nutritionGoalsSection
                            .padding(.top)
                        
                        RecipeSliderView(title: "Upcoming Meals", recipes: DeveloperPreview.recipes)
                            .padding(.top)
                        
                        newsfeedSection
                            .padding(.horizontal)
                        
                    }
                }
            }
            .background(Color("BackgroundColor"))
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    LargeTitle(title: "Home")
                        .padding(.top, 10)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    // FIXME: WHEN NAVIGATING TO OTHER NAVIGATIONLINK THE IMAGE CROPS.
                    ProfilePicture(user: UserService.shared.currentUser, size: .medium)
                        .padding(.top, 50)
                }
            }
            .navigationDestination(for: Post.self, destination: { post in
                FeedCell(post: post)
            })
        }
    }
    
    private var nutritionGoalsSection: some View {
        VStack {
            HStack(alignment: .bottom) {
                Text("Nutrition Goals")
                    .font(.title)
                    .foregroundStyle(Color("TitleColor"))
                Spacer()
                Button(action: {
                    
                    print("See More Clicked!")
                }, label: {
                    Text("See more")
                        .font(.subheadline)
                        .foregroundStyle(.customBlue)
                })
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal) {
                LazyHStack (spacing: 10) {
                    Button{
                        
                    } label: {
                        NutritionTileView(progress: 0.9, title: "Calories", size: .medium, isPercentage: false)
                    }
                    .padding(.leading)
                    
                    Button{
                        
                    } label: {
                        NutritionTileView(progress: 0.4, title: "Proteins", size: .medium, isPercentage: true)
                    }
                    
                    Button{
                        
                    } label: {
                        NutritionTileView(progress: 0.7, title: "Carbs", size: .medium, isPercentage: true)
                    }
                    
                    Button{
                        
                    } label: {
                        NutritionTileView(progress: 1.20, title: "Fats", size: .medium, isPercentage: true)
                    }
                    .padding(.trailing)
                }
            }
        }
    }
    
    private var newsfeedSection: some View {
        VStack {
            HStack(alignment: .bottom) {
                Text("Newfeed")
                    .font(.title)
                    .foregroundStyle(Color("TitleColor"))
                Spacer()
            }
            
            
            LazyVStack (spacing: 20){
                ForEach(viewModel.posts) { post in
                    NavigationLink(value: post) {
                        FeedCell(post: post)
                            .shadow(radius: 3)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
