//
//  Reminder.swift
//  Eye Remind
//
//  Created by Jeremy Tygh on 12/22/21.
//

import Foundation
import UserNotifications

struct Reminder {
    init(isToggled: Bool, frequency: Int) {
        self.isToggled = isToggled
        self.frequency = frequency
    }
    
    var count: Int = 0
    var showingTimer = false

    var isToggled: Bool {
        didSet {
            if self.isToggled == true {
                /*
                 Authorize notifications.
                 ------------------------------------------------
                 */
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
                
                /*
                 Create and request notification.
                 -------------------------------------------------
                 */
                createNotifications()
                requestNotifications()
                
            } else {
                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            }
        }
    }//are reminders turned on
    
    //time between notifications
    var frequency: Int {
        didSet {
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            if isToggled {
                createNotifications()
                requestNotifications()
            }
        }
        //if user changes frequency, clear all prior notifications, create new one with given frequency, and
        //add it as a request (only create and add new notification if isToggled is true).
    }
    
    private var content: UNMutableNotificationContent? = nil
    private var trigger: UNTimeIntervalNotificationTrigger? = nil
    private var request: UNNotificationRequest? = nil
    
    var nextNotificationTime: Date? {
        if isToggled && trigger != nil {
            return trigger?.nextTriggerDate()
        }
        
        return nil
    }


    private mutating func createNotifications() {
        let completeAction = UNNotificationAction(identifier: "COMPLETE_ACTION",
              title: "Complete", options: [.foreground])
        let completeCategory =
              UNNotificationCategory(identifier: "COMPLETE_CATEGORY",
              actions: [completeAction],
              intentIdentifiers: [],
              hiddenPreviewsBodyPlaceholder: "",
              options: .customDismissAction)
        
        content = UNMutableNotificationContent()
        content?.title = "Take a break"
        content?.subtitle = "Please look away for 20 seconds"
        content?.sound = UNNotificationSound.default
        content?.categoryIdentifier = "COMPLETE_CATEGORY"
        
        // show this notification x seconds from now
        trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(60 * frequency), repeats: true)

        // choose a random identifier
        request = UNNotificationRequest(identifier: UUID().uuidString, content: content!, trigger: trigger)

        // add our notification request and category
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request!)
        notificationCenter.setNotificationCategories([completeCategory])
    }
    
    private func requestNotifications() {
        UNUserNotificationCenter.current().add(request!)
    }
    
    mutating func toggleTimer() {
        showingTimer.toggle()
    }
    
}
