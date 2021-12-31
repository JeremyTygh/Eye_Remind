//
//  EyeReminder.swift
//  Eye Remind
//
//  Created by Jeremy Tygh on 12/22/21.
//

import Foundation
import UserNotifications
import SwiftUI

class EyeReminder: ObservableObject {
    static let shared = EyeReminder() //this is a shared instance for access in app delegate
    @Published var reminder: Reminder
    
    init() {
        reminder = Reminder(isToggled: UserDefaults.standard.object(forKey: "isToggled") as? Bool ?? false,
                            frequency: UserDefaults.standard.object(forKey: "frequency") as? Int ?? 20)
    }
    
    var isToggled: Bool {
        get { return reminder.isToggled }
        set {
            reminder.isToggled = newValue
            UserDefaults.standard.set(reminder.isToggled, forKey: "isToggled")
        }
    }
    
    var showingTimer: Bool {
        get { return reminder.showingTimer }
        set {
            reminder.showingTimer = newValue
            UserDefaults.standard.set(reminder.showingTimer, forKey: "showingTimer")
        }
    }
    
    var frequency: Int {
        get { return reminder.frequency }
        set {
            reminder.frequency = newValue
            UserDefaults.standard.set(reminder.frequency, forKey: "frequency")
        }
    }
    
    var nextNotificationTime: Date? {
        reminder.nextNotificationTime
    }
    
    var count: Int {
        get { return reminder.count }
        set { reminder.count = newValue }
    }
    
    func toggleTimer() {
        reminder.toggleTimer()
    }
    
}
