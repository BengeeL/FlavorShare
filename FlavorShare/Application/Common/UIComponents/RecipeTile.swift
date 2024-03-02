//
//  RecipeTile.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-29.
//

import SwiftUI

struct RecipeTile: View {
    
    let img: String
    let title: String
    let stars: Int
    let minutes: Int
    let calories: Int
    
    var body: some View {
        ZStack {
            backgroundIMG
            shadowOverlay
            recipeInfo
        }
        .cornerRadius(25)
        .frame(width: 150, height: 200, alignment: .leading)
        .ignoresSafeArea(.all)
    }
    
    private var backgroundIMG: some View {
        Image(img)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200, alignment: .leading)
            .clipped()
    }
    
    private var shadowOverlay: some View {
        LinearGradient(
            gradient: .init(
                colors: [.black.opacity(1), .clear]
            ),
            startPoint: .bottom,
            endPoint: .top)
    }
    
    private var recipeInfo: some View {
        VStack (spacing: 10){
            Spacer()
            recipeTitle
            recipeStars
            HStack {
                recipeTime
                recipeCalories
                Spacer()
            }
        }
        .padding(.bottom, 20)
        .padding(.horizontal, 20)
    }
    
    private var recipeTitle: some View {
        HStack {
            Text(title)
                .font(.subheadline)
                .fontWeight(.heavy)
                .foregroundColor(.white)
            Spacer()
        }
    }
    
    private var recipeStars: some View {
        HStack {
            ForEach(1...stars, id: \.self) { _ in
                starIcon
            }
            Spacer()
        }
        .padding(.leading, 5)
    }
    
    private var starIcon: some View {
        Image("starIcon")
            .resizable()
            .foregroundColor(.customYellow)
            .frame(width: 10, height: 10)
    }
    
    private var recipeTime: some View {
        Text("\(minutes) Min.")
            .font(.body)
            .fontWeight(.bold)
            .foregroundColor(Color("SubtittleColor"))
    }
    
    private var recipeCalories: some View {
        Text("\(calories) Cal.")
            .font(.body)
            .fontWeight(.bold)
            .foregroundColor(Color("SubtittleColor"))
    }
}

#Preview {
    RecipeTile(img: "welcomeViewBackground", title: "Test Recipe With Very Long Name", stars: 4, minutes: 30, calories: 320)
}
