//
//  RegisterView.swift
//  ToDoApp-SwiftUI
//
//  Created by Ferhat Şayık on 27.08.2025.
//

import SwiftUI

struct RegisterView: View {
    
   @StateObject var viewModel = RegisterViewVM()
    
    
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
                    TextField("Name...", text: $viewModel.name)
                        .autocorrectionDisabled()
                    TextField("Email...", text: $viewModel.eMail)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                }
                .frame(height: 220)
                
                BigButton(title: "Register", action: viewModel.register)
                Spacer()
                
                //Footer
                
               
            }
        }
    }
}

#Preview {
    RegisterView()
}
