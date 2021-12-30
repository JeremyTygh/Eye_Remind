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
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(EyeReminder())
    }
}
