//
//  MainViewVM.swift
//  ToDoApp-SwiftUI
//
//  Created by Ferhat Şayık on 27.08.2025.
//

import Foundation
import FirebaseAuth

class MainViewVM: ObservableObject {
    @Published var currentUserID: String = ""
    
   
    init() {
        Auth.auth().addStateDidChangeListener { [weak self] _,ussers in
            DispatchQueue.main.async {
                self?.currentUserID = ussers?.uid ?? ""
            }
        }
        
    }
    
    public var isSingeded: Bool {
        return Auth.auth().currentUser != nil
    }
}
