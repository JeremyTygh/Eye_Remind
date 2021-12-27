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
//    var statusItem: NSStatusItem? = nil
   
    func applicationDidFinishLaunching(_ aNotification: Notification) {
//        // Creating SwiftUI view that will act as window contents.
//        let contentView = ContentView()
//
//        let view = NSHostingView(rootView: contentView)
//
//        //Setting frame size.
//        view.frame = NSRect(x: 0, y: 0, width: 200, height: 50)
//
//        let menuItem = NSMenuItem()
//        menuItem.view = view
//
//        let menu = NSMenu()
//        menu.addItem(menuItem)
//
//        self.statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
//        self.statusItem?.menu = menu
//        self.statusItem?.button?.title = "Eye"
//        self.statusItem?.button?.image = NSImage(systemSymbolName: "eye", accessibilityDescription: "Eye")
//
////        NSApp.activate(ignoringOtherApps: true) //fixes bug where toggles in statusItem view do not click properly.
//
//        menuItem.view?.window?.makeKey()
        
        /*
         Notification code below
         */
        UNUserNotificationCenter.current().delegate = self
    }

}

/* extension allows for notifications to be sent even when app is in foreground.*/
extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        return completionHandler([.list, .sound])
    }
}

