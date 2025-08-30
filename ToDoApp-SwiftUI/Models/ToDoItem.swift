//
//  ToDoItem.swift
//  ToDoApp-SwiftUI
//
//  Created by Ferhat Şayık on 30.08.2025.
//

import Foundation

struct ToDoItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createData: TimeInterval
    var isDone: Bool
    
    mutating func isDone(_ state: Bool ) {
        isDone = state
    }
    
}
