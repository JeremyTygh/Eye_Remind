//
//  Eye_RemindApp.swift
//  Eye Remind
//
//  Created by Jeremy Tygh on 12/22/21.
//

import SwiftUI
import UserNotifications

@main
struct Eye_RemindApp: App {
//    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @StateObject var eyeReminder = EyeReminder()
    @NSApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
//            ZStack {
//                EmptyView()
//            }
//            .hidden() //this is if i chose to have just a status bar app.
            ContentView()
                .environmentObject(eyeReminder)
        }
        
    }
    

}
