//
//  NewsfeedPost.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-29.
//

import SwiftUI

struct NewsfeedPost: View {
    let img: String
    let stars: Int
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .top) {
                imagePost
                headerPost
            }
            tileContent
        }
        .cornerRadius(25)
        .frame(width: UIScreen.main.bounds.width - 40)
    }
    
    private var imagePost: some View {
        Image(img)
            .resizable()
            .scaledToFill()
    }
    
    private var headerPost: some View {
        ZStack (alignment: .top) {
            shadowOverlay
            userInfo
        }
    }
    
    private var shadowOverlay: some View {
        LinearGradient(
            gradient: .init(
                colors: [.black.opacity(1), .clear]
            ),
            startPoint: .top,
            endPoint: .bottom)
        .frame(height: UIScreen.main.bounds.width / 3)
    }
    
    private var userInfo: some View {
        HStack (alignment: .top) {
            imgProfile
            VStack (alignment: .leading){
                Text("Benjamin")
                    .font(.title2)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .shadow(radius: 10.0)
                Text("Follow")
                    .font(.subheadline)
                    .foregroundColor(.customBlue)
                    .fontWeight(.heavy)
                    .shadow(radius: 10.0)
            }
            Spacer()
            VStack (alignment: .trailing, spacing: 7.5){
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image("CalendarAddIcon")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(.white)
                        .frame(width: 25, height: 25)
                        .padding(.trailing, 10)
                        .padding(.top, 10)
                })
            }
        }
        .padding(15)
    }
    
    private var imgProfile: some View {
        Image("ProfilePictureExemple")
            .resizable()
            .scaledToFill()
            .frame(width: 70, height: 70)
            .cornerRadius(30)
            .shadow(radius: 10)
            .clipped()
    }
    
    private var tileContent: some View {
        VStack (alignment: .leading, spacing: 0){
            HStack(alignment: .center) {
                recipeStars
                Spacer()
                actionIcons
            }
            recipeName
            recipeDescription
            HStack(alignment: .top) {
                Spacer()
                seeMoreButton
            }
        }
        .background {
            Rectangle()
                .foregroundColor(Color("TileColor"))
                .frame(width: UIScreen.main.bounds.width - 40)
                .clipShape(RoundedBottomCorners(radius: 25))
        }
        .padding(.horizontal, 15)        
    }
    
    private var recipeStars: some View {
        HStack (alignment: .center) {
            if (stars > 0) {
                ForEach(1...stars, id: \.self) { _ in
                    starIcon
                }
            }
            if (stars < 5) {
                ForEach(1...5 - stars, id: \.self) { _ in
                    Image("StarEmptyIcon")
                        .resizable()
                        .foregroundColor(.customYellow)
                        .frame(width: 20, height: 20)
                }
            }
            Spacer()
        }
        .padding(.vertical, 15)
    }
    
    private var starIcon: some View {
        Image("starIcon")
            .resizable()
            .foregroundColor(.customYellow)
            .frame(width: 20, height: 20)
    }
    
    private var actionIcons: some View {
        HStack (alignment: .center, spacing: 10) {
            Image("ShareIcon")
                .resizable()
                .foregroundColor(Color("TextColor"))
                .frame(width: 25, height: 25)
            Image("MessageIcon")
                .resizable()
                .foregroundColor(Color("TextColor"))
                .frame(width: 25, height: 25)
            Image("EmptyHeartIcon")
                .resizable()
                .foregroundColor(.customRed)
                .frame(width: 25, height: 25)
        }
        .padding(.vertical, 15)
    }
    
    private var recipeName: some View {
        Text("This is my Recipe Name")
            .foregroundColor(Color("TitleColor"))
            .font(.title2)
            .fontWeight(.heavy)
    }
    
    private var recipeDescription: some View {
        Text("This is a Dheuhewjwijvbw nfbiwela ba dsbjvb abg evbl bvhbeavbhg hewhj ebibc bfvbagbv begb vj bjkgbeljvbzdgbvjz")
            .foregroundColor(Color("TitleColor"))
            .font(.body)
            .multilineTextAlignment(.leading)
    }
    
    private var seeMoreButton: some View {
        Text("See more")
            .foregroundColor(.customBlue)
            .font(.subheadline)
            .fontWeight(.bold)
            .padding(.vertical, 15)
    }
}
//
//struct RoundedTopCorners: Shape {
//    let radius: CGFloat
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + radius))
//        path.addArc(center: CGPoint(x: rect.minX + radius, y: rect.minY + radius),
//                    radius: radius,
//                    startAngle: Angle(degrees: 180),
//                    endAngle: Angle(degrees: 270),
//                    clockwise: false)
//        path.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.minY))
//        path.addArc(center: CGPoint(x: rect.maxX - radius, y: rect.minY + radius),
//                    radius: radius,
//                    startAngle: Angle(degrees: 270),
//                    endAngle: Angle(degrees: 0),
//                    clockwise: false)
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
//        return path
//    }
//}

private struct RoundedBottomCorners: Shape {
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - radius))
        path.addArc(center: CGPoint(x: rect.minX + radius, y: rect.maxY - radius),
                    radius: radius,
                    startAngle: Angle(degrees: 180),
                    endAngle: Angle(degrees: 90),
                    clockwise: true)
        path.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.maxY))
        path.addArc(center: CGPoint(x: rect.maxX - radius, y: rect.maxY - radius),
                    radius: radius,
                    startAngle: Angle(degrees: 90),
                    endAngle: Angle(degrees: 0),
                    clockwise: true)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        return path
    }
}

#Preview {
    NewsfeedPost(img: "welcomeViewBackground", stars: 5)
}
