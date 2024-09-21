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
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    SettingsView(showSignInView: .constant(false))
}
