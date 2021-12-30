//
//  DismissingTimer.swift
//  Eye Remind
//
//  Created by Jeremy Tygh on 12/28/21.
//

import SwiftUI

struct DismissingTimer: View {
    @State private var timeRemaining = 20
    @Binding var isRunning: Bool
    @State var timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    @EnvironmentObject var eyeReminder: EyeReminder
    
    @State var progressValue: Float  = 0.0 //for CircularTimer

//    @Environment(\.presentationMode) var isPresented
        //note: this will be deprecated soon. On macOS 12.0 and up, use isPresented instead.
    
    var body: some View {
        VStack {
            Group {
                Text("Time Remaining: \(timeRemaining)")
                    .foregroundColor(isRunning ? .primary : .gray)
                    .font(.largeTitle)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    //the above 2 view modifiers are to stop odd truncating behavior.
                CircularTimer(progress: self.$progressValue)
                    .frame(width: 150.0, height: 150.0)
                    .padding()
            }
                .onReceive(timer) { time in
                    if self.timeRemaining > 0 && isRunning && eyeReminder.isToggled {
                        self.timeRemaining -= 1
                        calculateProgress()
                    } else if isRunning {
                        NSSound.beep() //play beep sound
                        stopTimer()
                        EyeReminder.shared.showingTimer = false
                        progressValue = 0.0
//                        isPresented.wrappedValue.dismiss()
                    } else {
                        stopTimer()
                        progressValue = 0.0
                    }
                }
                .onChange(of: isRunning) { newValue in
                    if newValue == true {
                        startTimer()
                    } else {
                        stopTimer()
                        progressValue = 0.0
                    }
                }
                .onChange(of: eyeReminder.frequency) { _ in
                    if eyeReminder.isToggled {
                        stopTimer()
                        progressValue = 0.0
                    }
                }
                .onAppear {
                    if isRunning && eyeReminder.isToggled {
                        startTimer()
                    } else {
                        stopTimer()
                        progressValue = 0.0
                    }
                }
        }
        .padding()
    }
    
    func calculateProgress() {
//        self.progressValue = Float(1 - (timeRemaining / 20))
        self.progressValue += 0.05
    }
    
    func stopTimer() {
        self.timer.upstream.connect().cancel()
        self.timeRemaining = 0
        isRunning = false
    }
    
    func startTimer() {
        self.timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
        self.timeRemaining = 20
    }
}

//struct DismissingTimer_Previews: PreviewProvider {
//    static var previews: some View {
//        DismissingTimer()
//    }
//}
