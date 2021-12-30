//
//  SettingsView.swift
//  Eye Remind
//
//  Created by Jeremy Tygh on 12/30/21.
//

import SwiftUI

struct SettingsView: View {
    @State var timerColor: Color
    //UserDefaults.standard.object(forKey: "timerColor") as? Color ?? Color.red
    
    init() {
        var color: Color? = nil
        do {
            if let loadedData = UserDefaults.standard.data(forKey: "timerColor"),
               let loadedColor =  try NSKeyedUnarchiver.unarchivedObject(ofClass: NSColor.self, from: loadedData) {
                color = Color(loadedColor)
            }
        } catch {
            print(error)
        }
        
        timerColor = color ?? Color.red
    }
    
    var body: some View {
        VStack {
            HStack {
                ColorPicker("Set the timer color", selection: $timerColor, supportsOpacity: false)
            }
            .onChange(of: timerColor) { _ in
                let color: NSColor = NSColor(timerColor)
                do {
                    var data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false)
                    data = Data(data) // added this and changed data to var from let!
                    UserDefaults.standard.set(data, forKey: "timerColor")
                } catch {
                    print(error)
                }
            }
        }
        .padding()
    }
    
//    func unarchiveColor() -> Color? {
//        do {
//            if let loadedData = UserDefaults.standard.data(forKey: "timerColor"),
//               let loadedColor =  try NSKeyedUnarchiver.unarchivedObject(ofClass: NSColor.self, from: loadedData) {
//                return Color(loadedColor)
//            }
//        } catch {
//            print(error)
//        }
//        return nil
//    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
