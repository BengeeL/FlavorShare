//
//  NavbarView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-11.
//

import SwiftUI

struct NavbarView: View {
    
    let user: User
    @State private var selectedIndex = 0
    
    var body: some View {
        TabView (selection: $selectedIndex) {
            HomeView()
                .onAppear {
                    selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
            
            SearchView()
                .onAppear {
                    selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .tag(1)
            
            UploadChoiceView()
                .onAppear {
                    selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "plus.square")
                }
                .tag(2)
            
            WeekView()
                .onAppear {
                    selectedIndex = 3
                }
                .tabItem {
//                    Image(systemName: "cart")
                    Image(systemName: "calendar")
                }
                .tag(3)
            
            CurrentUserProfileView(user: user)
                .onAppear {
                    selectedIndex = 4
                }
                .tabItem {
                    Image(systemName: "person")
                }
                .tag(4)
        }
        .accentColor(.customBlue)
    }
}

#Preview {
    NavbarView(user: DeveloperPreview.users[0])
}
