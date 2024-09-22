//
//  SettingsView.swift
//  FireCRUD
//
//  Created by Lovice Sunuwar on 21/09/2024.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
    
    
    func logOut() throws {
        try AuthenticationManager.shared.signOut()
    }
    
    func resetPassword() async throws {
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
        try await AuthenticationManager.shared.resetPassword(email: email)
    }
    
    func updateEmail() async throws{
        let email = "fakeemail@agent.com"
        
        try await AuthenticationManager.shared.updateEmail(email: email)
    }
    
    func updatePassword() async throws {
        let password = "fakepassword"
        try await AuthenticationManager.shared.updatePassword(password: password)
    }
    
    func deleteUser() async throws {
        try await AuthenticationManager.shared.deleteUser()
    }
    
   
    
}

struct SettingsView: View {
    
    
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    var body: some View {
        List {
            Button("Log Out") {
                Task {
                    do {
                        try viewModel.logOut()
                        showSignInView = true
                    } catch {
                        print("error: \(error)")
                    }
                }
                
            }
            
            Button(role: .destructive) {
                Task {
                    do {
                        try await viewModel.deleteUser()
                        showSignInView = true
                        
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text ("Delete account")
            }
            // MARK: Email View
            
            emailSection
          
            
            
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView(showSignInView: .constant(false))
}


extension SettingsView {
    private var emailSection: some View{
        Section {
            Button("Reset Password") {
                Task {
                    do {
                        try await viewModel.resetPassword()
                        print("Password Reset!!!")
                    } catch {
                        print("error: \(error)")
                    }
                }
                
            }
            
            Button("Update Password") {
                Task {
                    do {
                        try await viewModel.updatePassword()
                        print("Password Updated!!!")
                    } catch {
                        print("error: \(error)")
                    }
                }
                
            }
            
            Button("Update Email") {
                Task {
                    do {
                        try await viewModel.updateEmail()
                        print("Email Updated!!!")
                    } catch {
                        print("error: \(error)")
                    }
                }
                
            }
        } header: {
            Text("Email Function")
        }
    }
}
