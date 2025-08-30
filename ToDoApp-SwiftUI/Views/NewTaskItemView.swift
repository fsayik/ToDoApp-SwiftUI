//
//  NewTaskItem.swift
//  ToDoApp-SwiftUI
//
//  Created by Ferhat Şayık on 30.08.2025.
//

import SwiftUI

struct NewTaskItemView: View {
    @Binding var isNewItem: Bool
    @StateObject var viewModel = NewTaskItemViewVM()
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.title)
                .bold()
            
            Form {
                TextField("Title", text: $viewModel.title)
                    .frame(height: 100)
                DatePicker("Finish Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                BigButton(title: "Add", action: {
                    if viewModel.canSave {
                        viewModel.save()
                        isNewItem = false
                    }else {
                        viewModel.showAlert = true
                    }
                    
                })
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Fail"), message: Text("Please Check Content"))
            })
        }
        .padding(.top, 50)
    }
}

#Preview {
    NewTaskItemView(isNewItem: Binding(get: {
        return true
    }, set: { _ in
        
    }
    ))
}
