//
//  ContentView.swift
//  Eye Remind
//
//  Created by Jeremy Tygh on 12/22/21.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    @EnvironmentObject var eyeReminder: EyeReminder
//    @State private var showingTimer = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Eye Reminder").bold()
                Spacer()
                Toggle("", isOn: $eyeReminder.isToggled)
                    .toggleStyle(.switch)
                    .frame(alignment: .center)
            }
            
            Divider()

            HStack {
                Text("Reminder Frequency")
                Spacer()
                Stepper("\(eyeReminder.frequency) minutes", value: $eyeReminder.frequency,
                        in: 5...60, step: 5)
            }
            
            Divider()
            
//            Text("Count: \(eyeReminder.count)")

           
            //IDEA: Play song during countdown, stop when done!
            //TODO: figure out why timer doesn't appear until click following launch from notification.
            //TODO: store user data in UserDefaults
            //TODO: add a graph of some sort to visualize data.
            //TODO: leverage .frame() to set boundaries for window height, width.
            //TODO: create a section of missed notifications (with times). Present option to "claim" as complete or disregard (incomplete).
        }
//        .sheet(isPresented: $eyeReminder.showingTimer) {
//            DismissingTimer()
//        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(EyeReminder())
    }
}
