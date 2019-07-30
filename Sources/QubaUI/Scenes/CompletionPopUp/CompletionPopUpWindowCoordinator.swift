//
//  CompletionPopUpWindowCoordinator.swift
//  QubaUI
//
//  Created by PondokIOS on 29/07/19.
//

import AppKit
import RxSwift

class CompletionPopUpWindowCoordinator: BaseCoordinator<String> {
    private lazy var windowController: CompletionWindowController = {
        return CompletionWindowController()
    }()
    override init() {
        super.init()
        windowController.loadWindow()
    }
    override func start() -> Observable<String> {
        windowController.showWindow(nil)
        return windowController.viewModel.output
            .selectedCompletion
            .asObservable()
            .do(onNext: { _ in
                self.windowController.close()
            })
    }
}
