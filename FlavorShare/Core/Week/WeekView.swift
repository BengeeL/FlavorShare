//
//  WeekView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-14.
//

import SwiftUI

struct WeekView: View {
    
    // MARK: TODO
    // TODO: COMING UP VIEW
    // TODO: CODE GROCERY LIST
    // TODO: CODE ORDER API
    // TODO: ADD OPTION TO ADD OTHER ITEM ON GROCERIE LIST 
    
    var body: some View {
        NavigationStack {
            ScrollView (.vertical) {
                VStack (alignment: .leading) {
                    // Coming up
                    HStack(alignment: .bottom) {
                        Text("Coming Up")
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
                    .padding(.top)
                    
                    Spacer()
                    
                    // Grocery list
                    HStack(alignment: .bottom) {
                        Text("Grocery List")
                            .font(.title)
                            .foregroundStyle(Color("TitleColor"))
                        Spacer()
                        Button(action: {
                            
                            print("See More Clicked!")
                        }, label: {
                            Text("Order \(Image(systemName: "cart"))")
                                .font(.subheadline)
                                .foregroundStyle(.customBlue)
                        })
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
//                    List(selection: <#T##Binding<SelectionValue>#>, content: <#T##() -> Content#>)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    LargeTitle(title: "Your Week")
                        .padding(.top, 10)
                }
            }
            .background(Color(.background))
        } // Navigation Stack
    }
}

#Preview {
    WeekView()
}
