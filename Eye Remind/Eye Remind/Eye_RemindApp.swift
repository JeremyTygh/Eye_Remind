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
    @StateObject var eyeReminder = EyeReminder.shared
    @NSApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            VStack {
                ContentView()
                DismissingTimer(isRunning: $eyeReminder.showingTimer)
                Text("Next notification: \(eyeReminder.nextNotificationTime ?? Date())")
                    .opacity(eyeReminder.nextNotificationTime == nil ? 0 : 1)
                    .padding()
                    .font(.title3)
            }
            .environmentObject(eyeReminder)
        }
        
        #if os(macOS)
        Settings {
            SettingsView()
        }
        #endif
    }
}

//IDEA: Play song during countdown, stop when done!
//TODO: Fix bug where time changes after timer completes.
//TODO: leverage .frame() to set boundaries for window height, width.
//TODO: Fix app appearing in foreground when notification is dismissed.
//TODO: create a section of missed notifications (with times). Present option to "claim" as complete or disregard (incomplete).
//TODO: add a graph of some sort to visualize data.

//HStack {
//    Spacer()
//    Button {
//        print("Hi")
//    } label: {
//        Image(systemName: "gearshape")
//            .font(.largeTitle)
//    }
//    .buttonStyle(GrowingButton())
//}
//.padding()
