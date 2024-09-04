//
//  WeekView.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-03-14.
//

import SwiftUI

struct WeekView: View {
    // MARK: TODO
    // TODO: ADD A RED GARBAGE ICON TO DELETE OR SWIPE TO DELETE
    // TODO: ADD CATEGORY SUB-HEADER + ORDER BY ALPHABETICAL ORDER
    // TODO: CODE GROCERY LIST
    // TODO: CODE ORDER API

    // MARK: VARIABLES
    @StateObject var viewModel = WeekViewModel()
    
    @FocusState private var isNewItemNameFocused: Bool
    @FocusState private var isNewItemQuantityFocused: Bool
    
    // MARK: BODY
    var body: some View {
        NavigationStack {
            ScrollView (.vertical) {
                VStack (alignment: .leading) {
                    // MARK: COMING UP
                    RecipeSliderView(title: "Coming Up", recipes: DeveloperPreview.recipes)
                    
                    
                    // MARK: GROCERY LIST
                    HStack(alignment: .bottom) {
                        Text("Grocery List")
                            .font(.title)
                            .foregroundStyle(Color("TitleColor"))
                        
                        Spacer()
                        
                        Button(action: {
                            print("Order Clicked!")
                        }, label: {
                            Text("Order \(Image(systemName: "cart"))")
                                .font(.subheadline)
                                .foregroundStyle(.customBlue)
                        })
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    LazyVStack {
                        ForEach(viewModel.groceryList) { item in
                            ListItem(groceryItem: item)
                        }
                    }
                    
                    Divider()
                        .padding(.horizontal)
                    
                    // MARK: ADD NEW ITEM
                    if viewModel.isEditing {
                        HStack {
                            TextField("Add a new item", text: $viewModel.newItem)
                                .textFieldStyle(.plain)
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .keyboardType(.default)
                                .submitLabel(.next)
                                .focused($isNewItemNameFocused)
                                .onSubmit {
                                    isNewItemQuantityFocused = true
                                }
                            
                            TextField("Quantity", text: $viewModel.quantity)
                                .textFieldStyle(.plain)
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .keyboardType(.numberPad)
                                .submitLabel(.done)
                                .focused($isNewItemQuantityFocused)
                                .onSubmit {
                                    addItem()
                                }
                        }
                        
                    } else {
                        Text("Add a new item")
                            .padding(.horizontal)
                            .padding(.vertical, 5)
                            .opacity(0.5)
                            .onTapGesture {
                                viewModel.isEditing = true
                                isNewItemNameFocused = true
                            }
                    }
        
                    Spacer()
                }
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
    
    // MARK: FUNCTIONS
    func addItem() {
        guard !viewModel.newItem.isEmpty else { return }
        guard let quantityValue = Int(viewModel.quantity) else {
            isNewItemQuantityFocused = true
            print("Invalid quantity entered!")
            return
          }
        
        let itemName = viewModel.newItem.capitalized
        
        Task {
            try await viewModel.addGroceryListItem(itemName: itemName, itemQuantity: quantityValue)
        }
    }
}

#Preview {
    WeekView()
}
