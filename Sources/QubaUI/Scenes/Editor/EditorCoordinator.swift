//
//  EditorCoordinator.swift
//  QubaUI
//
//  Created by PondokIOS on 29/07/19.
//

import AppKit
import RxSwift

final class EditorCoordinator: BaseCoordinator<Void> {
    private unowned let window: NSWindow
    init(window: NSWindow) {
        self.window = window
    }

    private var controller: NSViewController!
    override func start() -> Observable<Void> {
        return Observable.create { [unowned window, self] o in
            let controller = EditorController()
            controller.viewModel = EditorViewModel(navigator: self)
            self.controller = controller
            window.contentView = controller.view
            window.center()
            window.makeKeyAndOrderFront(NSApp)
            NSApp.activate(ignoringOtherApps: true)
            o.onCompleted()
            return Disposables.create()
        }
    }

    private var completionPopUpWindow: CompletionPopUpWindowCoordinator!
}

extension EditorCoordinator: EditorNavigator {
    func showCompletionPopUpWindow() -> Observable<String> {
//        if completionPopUpWindow == nil {
//            completionPopUpWindow = CompletionPopUpWindowCoordinator()
//        }
//        let coordinator = completionPopUpWindow
        let coordinator = CompletionPopUpWindowCoordinator()
        return coordinate(to: coordinator)
    }
}
