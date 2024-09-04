//
//  SearchView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-12.
//

import SwiftUI

struct SearchView: View {
    
    // MARK: TODO
    // TODO: ADD FILTER BY RECIPE CATEGORY/CUISINE TYPE
    // TODO: ADD FILTER BY POST TYPE
    // TODO: FILTER BY RATING
    // TODO: FILTER BY COST
    // TODO: FILTER BY
    
    // MARK: VARIABLES
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    
    // MARK: BODY
    var body: some View {
        NavigationStack {
            ScrollView {
                // MARK: LATEST LIKED
                RecipeSliderView(title: "Latest Liked", recipes: DeveloperPreview.recipes)
                
                // MARK: RECENT ACCOUNT VIEWED
                VStack (alignment: .leading){
                    UserListView(config: .explore)
                }
                .padding(.horizontal)
                
            }
            .background(Color("BackgroundColor"))
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user, presentationMode: false)
            })
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    LargeTitle(title: "Explore")
                        .padding(.top, 10)
                }
            }
        }
    }
}

#Preview {
    SearchView()
}
