//
//  AppDelegate.swift
//  Quba
//
//  Created by PondokIOS on 27/07/19.
//

import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!
    var controller: NSViewController!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 100, height: 100),
            styleMask: [
                .resizable,
                .closable,
                .titled,
                .miniaturizable,
            ],
            backing: .buffered,
            defer: false)
        
        controller = EditorController()
        window.contentView = controller.view
        window.center()
        NSApp.activate(ignoringOtherApps: true)
        window.makeKeyAndOrderFront(NSApp)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}
