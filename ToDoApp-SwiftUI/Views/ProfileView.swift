//
//  ProfileView.swift
//  ToDoApp-SwiftUI
//
//  Created by Ferhat Şayık on 30.08.2025.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewVM()
    private let userId: String
    
    init( userId: String ){
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .foregroundStyle(Color(.systemBlue))
                        .frame(width: 125, height: 125)
                    VStack {
                        HStack {
                            Text("Name:  ")
                            Text(user.name)
                        }
                        HStack {
                            Text("Mail:  ")
                            Text(user.email)
                        }
                        HStack {
                            Text("Joined:  ")
                            Text(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))
                        }
                    }
                    BigButton(title: "Logout", action: {
                        viewModel.logout()
                    })
                }
                else {
                    Text("Profile Loading!...")
                }
            }
            .navigationTitle("Profile")
            
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView(userId: "J3DISdAc3SNGJsfSwd2HbvyCAV82")
}
