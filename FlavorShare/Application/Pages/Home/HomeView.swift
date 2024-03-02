//
//  HomeView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-02-29.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack (spacing: 30) {
                headerHome
                upcomingMealsSection
                nutritionGoalsSection
                newsfeedSection
            }
            .padding(.top, 10)
            .padding(.horizontal, 20)
        }
        .background(Color("BackgroundColor"))
    }
    
    private var headerHome: some View {
        HStack (alignment: .bottom) {
            pageTitle
            Spacer()
            imgProfile
        }
    }
    
    private var pageTitle: some View {
        VStack (alignment: .leading){
            Text("Home")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color("TitleColor"))
            
            Text("Hello, \("Benjamin")!")
                .font(.title2)
                .foregroundColor(Color("SubtittleColor"))
        }
    }
    
    private var imgProfile: some View {
        Image("ProfilePictureExemple")
            .resizable()
            .scaledToFill()
            .frame(width: 120, height: 120)
            .cornerRadius(80)
            .shadow(radius: 3)
            .clipped()
    }
    
    private var upcomingMealsSection: some View {
        VStack {
            HStack(alignment: .bottom) {
                Text("Upcoming Meals")
                    .font(.title)
                    .foregroundColor(Color("TitleColor"))
                Spacer()
                Button(action: {
                    
                    print("See More Clicked!")
                }, label: {
                    Text("See more")
                        .font(.subheadline)
                        .foregroundColor(.customBlue)
                })
            }
            
            ScrollView(.horizontal) {
                HStack (spacing: 60) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        RecipeTile(img: "welcomeViewBackground", title: "Hummus with Pita Bread", stars: 4, minutes: 45, calories: 466)
                            .multilineTextAlignment(.leading)
                            .shadow(radius: 3)
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        RecipeTile(img: "welcomeViewBackground", title: "Hummus with Pita Bread", stars: 4, minutes: 45, calories: 466)
                            .multilineTextAlignment(.leading)
                            .shadow(radius: 3)
                            .padding(.trailing, 60)
                    })
                }
            }
        }
    }
    
    private var nutritionGoalsSection: some View {
        VStack {
            HStack(alignment: .bottom) {
                Text("Nutrition Goals")
                    .font(.title)
                    .foregroundColor(Color("TitleColor"))
                Spacer()
                Button(action: {
                    
                    print("See More Clicked!")
                }, label: {
                    Text("See more")
                        .font(.subheadline)
                        .foregroundColor(.customBlue)
                })
            }
            
            ScrollView(.horizontal) {
                HStack (spacing: 60) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        RecipeTile(img: "welcomeViewBackground", title: "Hummus with Pita Bread", stars: 4, minutes: 45, calories: 466)
                            .multilineTextAlignment(.leading)
                            .shadow(radius: 3)
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        RecipeTile(img: "welcomeViewBackground", title: "Hummus with Pita Bread", stars: 4, minutes: 45, calories: 466)
                            .multilineTextAlignment(.leading)
                            .shadow(radius: 3)
                            .padding(.trailing, 60)
                    })
                }
            }
        }
    }
    
    private var newsfeedSection: some View {
        VStack {
            HStack(alignment: .bottom) {
                Text("Newfeed")
                    .font(.title)
                    .foregroundColor(Color("TitleColor"))
                Spacer()
            }
            
            NewsfeedPost(img: "welcomeViewBackground", stars: 5)
                .shadow(radius: 3)
                .padding(.bottom, 20)
            NewsfeedPost(img: "welcomeViewBackground", stars: 5)
                .shadow(radius: 3)
            
            Text("The END")
                .foregroundColor(Color("TitleColor"))
                .font(.title)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    HomeView()
}
