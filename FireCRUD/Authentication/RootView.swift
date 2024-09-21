//
//  RootView.swift
//  FireCRUD
//
//  Created by Lovice Sunuwar on 21/09/2024.
//

import SwiftUI

struct RootView: View {
    
    @State private var showSignInView: Bool = false
    
    var body: some View {
        
        ZStack {
            NavigationStack {
                SettingsView(showSignInView: $showSignInView)
            }
        }
        // MARK: ON Appear
        //  every time the user the opens the app we are going to see if they are previously authenticated or not.
        .onAppear() {
            let authUser = try?  AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil 
        }
        .fullScreenCover(isPresented: $showSignInView, content: {
            NavigationStack{
                AuthView()
            }
        })
        
    }
}

#Preview {
    RootView()
}
