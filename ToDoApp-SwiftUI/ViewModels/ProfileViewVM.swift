//
//  ProfileViewVM.swift
//  ToDoApp-SwiftUI
//
//  Created by Ferhat Şayık on 30.08.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewVM: ObservableObject {
    @Published var user: User? = nil
    
    init(){
        
    }
    
    func fetchUser() {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userID).getDocument { [weak self ] snapshot, error in
                guard let data = snapshot?.data(), error == nil else { return }
                
                DispatchQueue.main.async {
                    self?.user = User(id: data["id"] as? String ?? "",
                                      email: data["email"] as? String ?? "",
                                      name: data["name"] as? String ?? "",
                                      joined: data["joined"] as? TimeInterval ?? 0)
                }
                
            }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Sign Out Error: \(error.localizedDescription)")
        }
    }
}
