//
//  CompletionWindowController.swift
//  QubaUI
//
//  Created by PondokIOS on 29/07/19.
//

import AppKit
import ViewDSL

final class CompletionWindowController: NSWindowController {
    private lazy var controller = CompletionPopUpController { c in
        c.viewModel = CompletionPopUpViewModel()
    }
    var viewModel: CompletionPopUpViewModel {
        return controller.viewModel
    }
    override func loadWindow() {
        window = CompletionPopUpWindow { [unowned self] w in
            w.styleMask = []
            w.contentView = self.controller.view
            w.delegate = self
        }
    }

    override func showWindow(_ sender: Any?) {
        window?.setFrame(CGRect(x: 0, y: 0, width: 300, height: 100), display: true)
        window?.center()
        super.showWindow(sender)
    }
}

extension CompletionWindowController: NSWindowDelegate {
    func windowDidBecomeKey(_ notification: Notification) {

    }

    func windowDidResignKey(_ notification: Notification) {
        window?.close()
    }
}

final class CompletionPopUpWindow: BorderlessWindow {
}

class BorderlessWindow: NSWindow {
    override var canBecomeKey: Bool {
        return true
    }
}
