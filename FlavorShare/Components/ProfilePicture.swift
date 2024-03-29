//
//  ProfilePicture.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-11.
//

import SwiftUI
import Kingfisher

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
    
    var user: User?
    let size: ProfileImageSize
    
    var body: some View {
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
    }
}

#Preview {
    ProfilePicture(user: DeveloperPreview.users[0], size: .large)
}
