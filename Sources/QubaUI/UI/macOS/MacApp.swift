//
//  MacApp.swift
//  Quba
//
//  Created by PondokIOS on 27/07/19.
//

import AppKit

class MacApp: App {
    let delegate: NSApplicationDelegate
    init() {
        delegate = AppDelegate()
    }
    public func run() throws {
        let app = NSApplication.shared
        app.delegate = delegate
        app.setActivationPolicy(.regular)
        app.run()
    }
}
