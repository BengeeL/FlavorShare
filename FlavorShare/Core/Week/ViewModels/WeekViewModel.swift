//
//  WeekViewModel.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-07-29.
//

import Foundation
import SwiftUI
import Firebase

@MainActor
class WeekViewModel: ObservableObject {
    // MARK: VARIABLES
    @Published var groceryList: [GroceryItem] = []
    @Published var newItem = ""
    @Published var quantity = ""
    @Published var isEditing: Bool = false

    init() {
        Task { try await getAllGroceryItem() }
    }
    
    // MARK: FUNCTIONS
    @MainActor
    func getAllGroceryItem() async throws {
        self.groceryList = try await GroceryListService.getGroceryList()
    }
    
    func addGroceryListItem(itemName: String, itemQuantity: Int) async throws {
        // Create GroceryItem to Add
        let groceryItem = GroceryItem(id: NSUUID().uuidString, category: "Grocery", name: itemName, quantity: itemQuantity, isChecked: false)
        
        // Post to server new Item
        try await GroceryListService.uploadGroceryItem(groceryItem)
                
        // Add to List
        groceryList.append(groceryItem)
        
        // Reset Field
        newItem = ""
        quantity = ""
    }
    
    // Delete GroceryListItem
    
    // Handle isChecked
    
}
