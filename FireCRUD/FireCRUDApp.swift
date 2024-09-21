//
//  FireCRUDApp.swift
//  FireCRUD
//
//  Created by Lovice Sunuwar on 21/09/2024.
//
import SwiftUI
import FirebaseCore

// MARK: AppDelegate
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct FireCRUDApp: App {
//    MARK: Firebase Init
    // Initializng the firebase via appDeleate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
