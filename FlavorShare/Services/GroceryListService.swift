//
//  GroceryList.swift
//  FlavorShare
//
//  Created by Benjamin Lefebvre on 2024-08-16.
//

import Foundation
import Firebase

struct GroceryListService {
    static func getGroceryList() async throws -> [GroceryItem] {
        guard let currentUid = Auth.auth().currentUser?.uid else { return [] }

        let snapshot = try await FirebaseContants
            .GroceryListCollection(uid: currentUid)
            .getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: GroceryItem.self) })
    }
    
    static func uploadGroceryItem(_ groceryItem: GroceryItem) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        guard let groceryItemData = try? Firestore.Encoder().encode(groceryItem) else { return }
        
        try await FirebaseContants
            .GroceryListCollection(uid: currentUid)
            .document(groceryItem.id)
            .setData(groceryItemData)
//            .addDocument(data: groceryItemData)
    }
    
    static func updateGroceryItemChecked(_ groceryItem: GroceryItem) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        print(currentUid)
        print(groceryItem)
        try await FirebaseContants
            .GroceryListCollection(uid: currentUid)
            .document(groceryItem.id)
            .updateData([
                "isChecked": groceryItem.isChecked
            ])
        
    }
}
