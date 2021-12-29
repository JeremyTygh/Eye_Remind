//
//  EyeReminder.swift
//  Eye Remind
//
//  Created by Jeremy Tygh on 12/22/21.
//

import Foundation
import UserNotifications

class EyeReminder: ObservableObject {
    static let shared = EyeReminder() //this is a shared instance for access in app delegate
    @Published var reminder: Reminder
    
    init() {
        reminder = Reminder(isToggled: false, frequency: 20)
    }
    
    var isToggled: Bool {
        get { return reminder.isToggled }
        set { reminder.isToggled = newValue }
    }
    
    var showingTimer: Bool {
        get { return reminder.showingTimer }
        set { reminder.showingTimer = newValue }
    }
    
    var frequency: Int {
        get { return reminder.frequency }
        set { reminder.frequency = newValue }
    }
    
    var count: Int {
        get { return reminder.count }
        set { reminder.count = newValue }
    }
    
    func toggleTimer() {
        reminder.toggleTimer()
    }
    
}
