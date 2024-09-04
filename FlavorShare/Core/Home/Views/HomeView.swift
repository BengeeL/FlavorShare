//
//  HomeView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-29.
//

import SwiftUI

struct HomeView: View {
    // MARK: VARIABLES
    @StateObject var viewModel = HomeViewModel()
    
    // MARK: BODY
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // MARK: WELCOME USER HEADER
                    VStack (spacing: 30) {
                        HStack {
                            Text("Hello, \("Benjamin")!")
                                .font(.title)
                                .foregroundStyle(Color("TitleColor"))
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        // MARK: NUTRITION SECTION
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
                        .padding(.top)
                        
                        // MARK: UPCOMING
                        RecipeSliderView(title: "Upcoming Meals", recipes: DeveloperPreview.recipes)
                            .padding(.top)
                        
                        // MARK: NEWSFEED
                        VStack {
                            HStack(alignment: .bottom) {
                                Text("Newfeed")
                                    .font(.title)
                                    .foregroundStyle(Color("TitleColor"))
                                Spacer()
                            }
                            
                            
                            LazyVStack (spacing: 20){
                                ForEach(viewModel.posts) { post in
                                    FeedCell(post: post)
                                        .shadow(radius: 3)
                                }
                            }
                        }
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
}

#Preview {
    HomeView()
}
