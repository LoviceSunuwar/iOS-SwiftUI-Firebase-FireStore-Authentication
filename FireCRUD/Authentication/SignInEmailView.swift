//
//  SignInEmailView.swift
//  FireCRUD
//
//  Created by Lovice Sunuwar on 21/09/2024.
//

import SwiftUI

// MARK: ViewModel
@MainActor
final class SignInEmailViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("Success")
                print(returnedUserData)
            }
            catch {
                print("Error: \(error)")
            }
        }
       
    }
    
}

struct SignInEmailView: View {
    
    @StateObject private var viewModel = SignInEmailViewModel()
    var body: some View {
        NavigationView {
            VStack {
                // MARK: EMAIL TXTFD
                TextField("Email....", text: $viewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                // MARK: PASSWORD TXTFD
                SecureField("Password....", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)
                // MARK: BTN
                Button {
                    viewModel.signIn()
                } label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                Spacer()
            }
            
            
            .navigationTitle("SignIn With Email")
        .padding()
        }
     
    }
        
}

#Preview {
    SignInEmailView()
}
