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
    
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found.")
            return
        }
        
        try await AuthenticationManager.shared.createUser(email: email, password: password)
       
    }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password was found")
            return
        }
        
        try await AuthenticationManager.shared.signInUser(email: email, password: password)
    }
    
}

struct SignInEmailView: View {
    
    @StateObject private var viewModel = SignInEmailViewModel()
    @Binding var showSignInView: Bool
    
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
                    Task {
                        do {
                           try await viewModel.signUp()
                            showSignInView = false
                            return
                        }
                        catch {
                            print("Error: \(error)")
                        }
                        
                        do {
                           try await viewModel.signIn()
                            showSignInView = false
                            return
                        }
                        catch {
                            print("Error: \(error)")
                        }
                    }
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
    SignInEmailView(showSignInView: .constant(false))
}
