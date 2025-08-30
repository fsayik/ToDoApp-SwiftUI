//
//  LoginViewVM.swift
//  ToDoApp-SwiftUI
//
//  Created by Ferhat Şayık on 27.08.2025.
//

import Foundation
import FirebaseAuth

class LoginViewVM: ObservableObject {
    
    @Published var eMail = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func login() {
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: eMail, password: password)
        
    }
    
    func validate() -> Bool {
        errorMessage = ""
        guard !eMail.trimmingCharacters(in: .whitespaces).isEmpty &&
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
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
