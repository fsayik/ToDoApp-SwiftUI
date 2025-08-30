//
//  ToDoListView.swift
//  ToDoApp-SwiftUI
//
//  Created by Ferhat Şayık on 28.08.2025.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListViewVM
    @FirestoreQuery var todoItems: [ToDoItem]
    
    
    init( userId: String ){
        self._todoItems = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewVM(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(todoItems) { item in
                TodoItemCell(item: item)
                        .swipeActions {
                            Button("Delete"){
                                viewModel.delete(itemId: item.id)
                            }
                            .foregroundStyle(Color.red)
                        }
                }
            }
            .navigationTitle("Tasks")
            .toolbar {
                Button {
                    viewModel.showingNewItem = true
                }label: {
                 Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItem, content: {
                NewTaskItemView(isNewItem:$viewModel.showingNewItem)
            })
        }
        
    }
}

#Preview {
    ToDoListView(userId: "J3DISdAc3SNGJsfSwd2HbvyCAV82")
}
