//
//  AppDelegate.swift
//  Quba
//
//  Created by PondokIOS on 27/07/19.
//

import AppKit
import RxSwift

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!
    var coordinator: BaseCoordinator<Void>!
    let disposeBag = DisposeBag()

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

        coordinator = EditorCoordinator(window: window)
        coordinator.start()
            .subscribe()
            .disposed(by: disposeBag)

    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}
