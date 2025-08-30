//
//  ToDoListViewVM.swift
//  ToDoApp-SwiftUI
//
//  Created by Ferhat Şayık on 30.08.2025.
//

import Foundation
import FirebaseFirestore

class ToDoListViewVM: ObservableObject {
    @Published var showingNewItem = false
    private let uId: String
    
    init(userId: String){
        self.uId = userId
    }
    
    func delete(itemId: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(itemId)
            .delete()
    }
    
}
