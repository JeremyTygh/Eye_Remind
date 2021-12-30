//
//  CircularTimer.swift
//  Eye Remind
//
//  Created by Jeremy Tygh on 12/29/21.
//

import SwiftUI

struct CircularTimer: View {
    @Binding var progress: Float
    @AppStorage("timerColor") var timerColor: Data?
    
    var body: some View {
        ZStack {
            Group {
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(0.3)
                    .foregroundColor(unarchiveColor())
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0))) //min() caps progress to 1.0
                    .stroke(style:StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(unarchiveColor())
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)
                //Eventually add Text() with countdown
            }
        }
        .padding()
    }
    
    func unarchiveColor() -> Color {
        var color: Color = .red
        do {
            if let loadedColor =  try NSKeyedUnarchiver.unarchivedObject(ofClass: NSColor.self, from: timerColor!) {
                color = Color(loadedColor)
            }
        } catch {
            print(error)
        }
        
        return color
    }
    
}

//struct CircularTimer_Previews: PreviewProvider {
//    static var previews: some View {
//        CircularTimer()
//    }
//}
