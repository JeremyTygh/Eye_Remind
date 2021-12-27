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
    @StateObject var eyeReminder = EyeReminder()
    @NSApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(eyeReminder)
        }
        
    }
    

}
