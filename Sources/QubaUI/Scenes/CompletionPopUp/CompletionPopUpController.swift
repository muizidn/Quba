//
//  CompletionPopUpController.swift
//  QubaUI
//
//  Created by PondokIOS on 29/07/19.
//

import AppKit
import ViewDSL
import TinyConstraints
import RxSwift
import RxCocoa

final class CompletionPopUpController: Controller {
    var viewModel: CompletionPopUpViewModel!
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        startBind()
    }

    // MARK: UI
    var counter = 0

    private func layoutUI() {
        view.wantsLayer = true
        view.layer?.cornerRadius = 10
        view.layer?.masksToBounds = true
        view.add { (v: NSButton) in
            v.setButtonType(NSButton.ButtonType.momentaryPushIn)
            v.title = "Select Completion \(counter)"
            v.centerInSuperview()
            v.rx.tap
                .do(onNext: {
                    self.counter += 1
                    v.title = "Select Completion \(self.counter)"
                })
                .bind(to: self.viewModel.input.requestCompletion)
                .disposed(by: self.disposeBag)
        }
    }

    // MARK: Binding

    private func startBind() {
        viewModel.output.error
            .drive()
            .disposed(by: disposeBag)
    }
}
