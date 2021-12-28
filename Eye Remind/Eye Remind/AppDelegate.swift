//
//  AppDelegate.swift
//  Eye Remind
//
//  Created by Jeremy Tygh on 12/23/21.
//

import Foundation

import Cocoa
import SwiftUI
import UserNotifications

class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        UNUserNotificationCenter.current().delegate = self
    }

}

/* extension allows for notifications to be sent even when app is in foreground.*/
extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        return completionHandler([.list, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
           withCompletionHandler completionHandler:
             @escaping () -> Void) {
        
       // Perform the task associated with the action.
       switch response.actionIdentifier {
       case "COMPLETE_ACTION":
          //increment count (eventually handle date)
          //using shared instance so we can access view model in this app delegate
          EyeReminder.shared.count += 1
           
          break

       // Handle other actions…
     
       default:
          break
       }
        
       // Always call the completion handler when done.
       completionHandler()
    }
}

