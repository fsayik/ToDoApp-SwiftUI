//
//  RegisterViewVM.swift
//  ToDoApp-SwiftUI
//
//  Created by Ferhat Şayık on 27.08.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewVM: ObservableObject {
    
    @Published var name = ""
    @Published var eMail = ""
    @Published var password = ""
    @Published var errorMessage = ""
      
      init(){}
      
      func register() {
          guard validate() else {
              return
          }
          
          Auth.auth().createUser(withEmail: eMail, password: password) { [weak self] result, error in
              guard let userID = result?.user.uid else {
                  return
              }
              
              self?.insertUserDataRecord(userId: userID)
                            
          }
          
      }
    
    func insertUserDataRecord(userId: String) {
        let user = User(id: userId, email: eMail, name: name, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .setData(user.asDictonary())
    }
    
    
      
      func validate() -> Bool {
          errorMessage = ""
          guard !eMail.trimmingCharacters(in: .whitespaces).isEmpty &&
                  !password.trimmingCharacters(in: .whitespaces).isEmpty &&
                    !name.trimmingCharacters(in: .whitespaces).isEmpty else {
              errorMessage = "Please enter mail and pasword"
              return false
          }
          guard eMail.contains("@") && eMail.contains(".") else {
              errorMessage = "Please enter correct mail"
              return false
          }
          
          return true
      }
}
