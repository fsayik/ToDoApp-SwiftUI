//
//  NewTaskItemViewVM.swift
//  ToDoApp-SwiftUI
//
//  Created by Ferhat Şayık on 30.08.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewTaskItemViewVM: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert: Bool = false
    
    init() {
        
    }
    
    func save() {
        guard canSave else {
            return
        }
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newItemId = UUID().uuidString
        let newItem = ToDoItem(id: newItemId,
                               title: title,
                               dueDate: dueDate.timeIntervalSince1970,
                               createData: Date().timeIntervalSince1970,
                               isDone: false)
        
        let dp = Firestore.firestore()
        dp.collection("users")
            .document(uId)
            .collection("todos")
            .document(newItemId)
            .setData(newItem.asDictonary())
        
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {
             return false
        }
        return true
    }
    
}
