//
//  TodoItemCellVM.swift
//  ToDoApp-SwiftUI
//
//  Created by Ferhat Şayık on 30.08.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class TodoItemCellVM: ObservableObject {
    
    init(){
        
    }
    
    func toggleIsDone(item: ToDoItem) {
        var copyItem = item
        copyItem.isDone(!item.isDone)
        
        guard let uId = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(copyItem.id)
            .setData(copyItem.asDictonary())
    }
}
