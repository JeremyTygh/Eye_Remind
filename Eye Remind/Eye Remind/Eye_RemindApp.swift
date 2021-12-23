//
//  Eye_RemindApp.swift
//  Eye Remind
//
//  Created by Jeremy Tygh on 12/22/21.
//

import SwiftUI

@main
struct Eye_RemindApp: App {
    @StateObject var eyeReminder = EyeReminder()
    
    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//
        WindowGroup {
            ContentView(eyeReminder: eyeReminder)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }.commands {
            CommandMenu("First menu") {
                Button("Action!") {
                    eyeReminder.message = "Hello, world"
                }
            }
        }
    }
}
