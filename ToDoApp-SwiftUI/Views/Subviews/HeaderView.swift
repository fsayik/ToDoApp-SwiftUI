//
//  HeaderView.swift
//  ToDoApp-SwiftUI
//
//  Created by Ferhat Şayık on 28.08.2025.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            Image(systemName: "rectangle.and.pencil.and.ellipsis")
                .resizable()
                .frame(width: 130 , height: 130)
                .foregroundStyle(Color(.magenta))
        }
        .padding(.top, 50)
        
    }
}

#Preview {
    HeaderView()
}
