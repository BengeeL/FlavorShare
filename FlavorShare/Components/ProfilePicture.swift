//
//  ProfilePicture.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-11.
//

import SwiftUI
import Kingfisher

// MARK: PROFILE IMAGE SIZE ENUM
enum ProfileImageSize {
    case xSmall
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
        case .xSmall:
            return 20
        case .small:
            return 60
        case .medium:
            return UIScreen.main.bounds.width / 4
        case .large:
            return UIScreen.main.bounds.width / 3
        }
    }
}

struct ProfilePicture: View {
    // MARK: VARIABLES
    var user: User?
    let size: ProfileImageSize
    @State private var showProfile = false
    @State private var selectedUser:  User? = nil
    
    // MARK: BODY
    var body: some View {
        Button(
            action: {
                showProfile.toggle()
                //                self.selectedUser = user
            },
            label: {
                //        VStack {
                if let imageURL = user?.profileImageURL {
                    KFImage(URL(string: imageURL))
                        .resizable()
                        .scaledToFill()
                        .frame(width: size.dimension, height: size.dimension)
                        .clipShape(Circle())
                        .shadow(radius: 3)
                } else {
                    Text("\(user?.firstName.first?.description ?? "")\(user?.lastName.first?.description ?? "")")
                        .frame(width: size.dimension, height: size.dimension)
                        .font(.title)
                        .fontWeight(.heavy)
                        .background(Color("TileColor"))
                        .foregroundStyle(.text)
                        .clipShape(Circle())
                        .shadow(radius: 3)
                }
                //        }
                //        .onTapGesture {
                //            self.selectedUser = user
                //        }
            })
        .fullScreenCover(isPresented: $showProfile, content: {
            if (user != nil) {
                ProfileView(user: user!, presentationMode: true)
                    .presentationDragIndicator(.visible)
            }
        })
        //        .fullScreenCover (item: $selectedUser) { user in
        //            ProfileView(user: user, presentationMode: true)
        //                .presentationDragIndicator(.visible)
        //        }
    }
}

#Preview {
    ProfilePicture(user: DeveloperPreview.users[0], size: .large)
}
