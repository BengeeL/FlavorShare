//
//  ListItem.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-07-29.
//

import SwiftUI

struct ListItem: View {
    // MARK: VARIABLES
    @State var groceryItem: GroceryItem

    // MARK: BODY
    var body: some View {
        VStack {
            Divider()
                .padding(.horizontal)
            
            ZStack {
                Button(
                    action: {
                        groceryItem.isChecked.toggle()
                        Task {
                            try await GroceryListService.updateGroceryItemChecked(groceryItem)
                        }
                    },
                    label: {
                        HStack {
                            // MARK: QUANTITY
                            Text("\(groceryItem.quantity)")
                                .frame(width: 25, alignment: .leading)
                            
                            // MARK: NAME
                            Text(groceryItem.name)
                                .frame(width: UIScreen.main.bounds.width / 3 * 2, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .strikethrough(groceryItem.isChecked ? true : false)

                            
                            Spacer()
                            
                            // MARK: CHECKBOX
                            Image(systemName: groceryItem.isChecked ? "checkmark.square" : "square")
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .foregroundColor(.text)
                    }
                )
            }// ZStack
            .opacity(groceryItem.isChecked ? 0.5 : 1)
        }
    }
}

#Preview {
    ListItem(groceryItem: DeveloperPreview.groceryList[0])
}
