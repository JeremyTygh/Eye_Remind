//
//  CircularTimer.swift
//  Eye Remind
//
//  Created by Jeremy Tygh on 12/29/21.
//

import SwiftUI

struct CircularTimer: View {
    @Binding var progress: Float

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.3)
                .foregroundColor(.red)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0))) //min() caps progress to 1.0
                .stroke(style:StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.red)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            //Eventually add Text() with countdown
        }
        .padding()
    }
}

//struct CircularTimer_Previews: PreviewProvider {
//    static var previews: some View {
//        CircularTimer()
//    }
//}
