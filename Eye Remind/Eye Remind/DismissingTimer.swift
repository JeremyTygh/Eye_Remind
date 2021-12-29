//
//  DismissingTimer.swift
//  Eye Remind
//
//  Created by Jeremy Tygh on 12/28/21.
//

import SwiftUI
import AVFoundation

struct DismissingTimer: View {
    @State private var timeRemaining = 20
    @EnvironmentObject var eyeReminder: EyeReminder
    
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
//    @Environment(\.presentationMode) var isPresented
        //note: this will be deprecated soon. On macOS 12.0 and up, use isPresented instead.
    
    var body: some View {
        VStack {
            Text("Time Remaining: \(timeRemaining)")
                .font(.largeTitle)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                //the above 2 view modifiers are to stop odd truncating behavior.
                .onReceive(timer) { time in
                    if self.timeRemaining > 0 {
                        self.timeRemaining -= 1
                    } else {
                        NSSound.beep() //play beep sound
                        eyeReminder.showingTimer = false
//                        isPresented.wrappedValue.dismiss()
                    }
                }
            Button("Dismiss") {
//                isPresented.wrappedValue.dismiss()
                eyeReminder.showingTimer = false
            }
        }
        .padding()
    }
}

struct DismissingTimer_Previews: PreviewProvider {
    static var previews: some View {
        DismissingTimer()
    }
}
