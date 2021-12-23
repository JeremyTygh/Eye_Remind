//
//  ContentView.swift
//  Eye Remind
//
//  Created by Jeremy Tygh on 12/22/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var eyeReminder: EyeReminder
    
    var body: some View {
//        VStack {
//            Toggle("Send notification", isOn:$eyeReminder.isToggled)
//
//            if eyeReminder.isToggled {
//                Text(eyeReminder.message)
//            }
//        }
//        .padding()
        Text(eyeReminder.message)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(eyeReminder: EyeReminder())
    }
}
