//
//  EyeReminder.swift
//  Eye Remind
//
//  Created by Jeremy Tygh on 12/22/21.
//

import Foundation
import UserNotifications

class EyeReminder: ObservableObject {
    @Published var reminder: Reminder
    
    init() {
        reminder = Reminder(isToggled: false, frequency: 20)
    }
    
    var isToggled: Bool {
        get { return reminder.isToggled }
        set { reminder.isToggled = newValue }
    }
    
    var frequency: Int {
        get { return reminder.frequency }
        set { reminder.frequency = newValue }
    }
    
}
