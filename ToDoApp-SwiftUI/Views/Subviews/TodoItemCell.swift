//
//  TodoItemCell.swift
//  ToDoApp-SwiftUI
//
//  Created by Ferhat Şayık on 30.08.2025.
//

import SwiftUI

struct TodoItemCell: View {
    
    @StateObject var viewModel = TodoItemCellVM()
    
    let item: ToDoItem
    var body: some View {
       
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title)
                Text(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            Spacer()
            Button(action: {
                viewModel.toggleIsDone(item: item)
            }, label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            })
        }
    }
}

#Preview {
    TodoItemCell(item:  .init(id: "as", title: "test title", dueDate: Date().timeIntervalSince1970, createData: Date().timeIntervalSince1970, isDone: false))
}
