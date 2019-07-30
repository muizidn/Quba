//
//  EditorController.swift
//  QubaUI
//
//  Created by PondokIOS on 27/07/19.
//

import AppKit
import ViewDSL
import TinyConstraints
import RxSwift
import RxCocoa

final class EditorController: Controller {
    var viewModel: EditorViewModel!
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        startBind()
    }

    // MARK: UI

    private func layoutUI() {
        view.add { (v: ScrollableTextView<CodeEditorTextView>) in
            v.edgesToSuperview()

            let textChanged = v.textView.rx.string
//                .throttle(
//                    RxTimeInterval.milliseconds(3000),
//                    scheduler: MainScheduler.instance)
                .asDriverOnErrorJustComplete()
            textChanged
                .drive(self.viewModel.input.editorString)
                .disposed(by: self.disposeBag)

            v.textView.rx.event
                .debug("Event", trimOutput: false)
                .filter({ $0.type == .keyDown })
                .bind(to: self.viewModel.input.keyDownEvent)
                .disposed(by: self.disposeBag)
        }
    }

    // MARK: Binding

    private func startBind() {
        viewModel.output.error
            .drive()
            .disposed(by: disposeBag)
        viewModel.output.action
            .drive()
            .disposed(by: disposeBag)
    }
}
