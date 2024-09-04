//
//  UserListView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-26.
//

import SwiftUI

struct UserListView: View {
    // MARK: VARIABLES
    @StateObject var viewModel = UserListViewModel()
    @State private var searchText = ""
    
    private let config: UserListConfig
    
    // MARK: INIT
    init(config: UserListConfig) {
        self.config = config
    }
    
    // MARK: BODY
    var body: some View {
        VStack (alignment: .leading){
            
            // MARK: RECENTLY VIEWED
            Text("Recent Accounts Viewed")
                .font(.title)
                .foregroundStyle(Color("TitleColor"))
                .padding(.top, 10)
            
            LazyVStack (spacing: 10) {
                ForEach (viewModel.users) { user in
                    NavigationLink(value: user) {
                        HStack {
                            ProfilePicture(user: user, size: .small)
                            
                            VStack (alignment: .leading){
                                Text(user.username)
                                    .fontWeight(.heavy)
                                Text("\(user.firstName) \(user.lastName)")
                            }
                            .font(.body)
                            
                            Spacer()
                        }
                        .foregroundStyle(.text)
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search")
            
            Spacer()
        }
        .task {
            await viewModel.getUsers(forConfig: config)
        }
    }
}

#Preview {
    UserListView(config: .explore)
}
