//
//  ContentView.swift
//  ToDoApp-SwiftUI
//
//  Created by Ferhat Şayık on 22.08.2025.
//

import SwiftUI



struct LoginView: View {
   @StateObject var viewModel = LoginViewVM()

    var body: some View {
        NavigationStack {
            VStack {
                // header
                HeaderView()
                // content
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                }
                Form {
                    TextField("email...", text: $viewModel.eMail)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                }
                .frame(height: 150)
                
                BigButton(title: "Login", action: viewModel.login)
                Spacer()
                
                //Footer
                
                VStack {
                    Text("No Acount")
                    NavigationLink("Create New Acount", destination: RegisterView())
                }
                .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    LoginView()
}

func asd(){
    print("asdasd")
}
