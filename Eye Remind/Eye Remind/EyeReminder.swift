//
//  EyeReminder.swift
//  Eye Remind
//
//  Created by Jeremy Tygh on 12/22/21.
//

import Foundation

class EyeReminder: ObservableObject {
    @Published var reminder: Reminder
    
    init() {
        reminder = Reminder(isToggled: false, frequency: 20, message: "\(Date())")
    }
    
    var isToggled: Bool {
        get { return reminder.isToggled }
        set { reminder.isToggled = newValue }
    }
    
    var frequency: Int {
        reminder.frequency
    }
    
    var message: String {
        get { return reminder.message }
        set { reminder.message = newValue }
    }
}
