//
//  MainView.swift
//  ToDoApp-SwiftUI
//
//  Created by Ferhat Şayık on 27.08.2025.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewVM()
    
    var body: some View {
        
        if viewModel.isSingeded, !viewModel.currentUserID.isEmpty {
            TabView {
                ToDoListView(userId: viewModel.currentUserID)
                    .tabItem {
                        Label("Tasks", systemImage: "house")
                    }
                ProfileView(userId: viewModel.currentUserID)
                    .tabItem{
                        Label("Profile", systemImage: "person.fill")
                    }
            }
            
        } else {
            LoginView()
        }
        
    }
}

#Preview {
    MainView()
}
