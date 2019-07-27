//  
//  EditorController.swift
//  QubaUI
//
//  Created by PondokIOS on 27/07/19.
//

import Foundation
import ViewDSL
import TinyConstraints
import RxSwift
import RxCocoa

final class EditorController: Controller {
    private let viewModel = EditorViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        startBind()
    }
    
    // MARK: UI
    
    private func layoutUI() {
        view.add { (v: ScrollableTextView<TextView>) in
            v.edgesToSuperview()
            
            v.textView.rx.string
                .throttle(
                    RxTimeInterval.milliseconds(3000),
                    scheduler: MainScheduler.instance)
                .asDriverOnErrorJustComplete()
                .drive(self.viewModel.input.editorString)
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
