//
//  User.swift
//  ToDoApp-SwiftUI
//
//  Created by Ferhat Şayık on 28.08.2025.
//

import Foundation

struct User: Codable {
    let id: String
    let email: String
    let name: String
    let joined: TimeInterval
}

