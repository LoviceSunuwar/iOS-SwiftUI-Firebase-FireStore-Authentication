//
//  AuthView.swift
//  FireCRUD
//
//  Created by Lovice Sunuwar on 21/09/2024.
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink{
                    Text("Hello, THERE")
                } label : {
                    Text("Sign In With Email")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                Spacer()
            }
            .padding()
        .navigationTitle("Sign In")
        }
    }
}

#Preview {
    AuthView()
}
