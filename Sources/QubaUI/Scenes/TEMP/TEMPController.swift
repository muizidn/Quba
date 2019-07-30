#if DEBUG
//
//  TEMPController.swift
//  QubaUI
//
//  Created by PondokIOS on 28/07/19.
//

import Foundation
import ViewDSL
import TinyConstraints
import RxSwift
import RxCocoa
import AppKit

final class TEMPController: Controller {
    private let viewModel = TEMPViewModel()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        startBind()
    }

    // MARK: UI

    private func layoutUI() {

        view.add { (v: StackView) in
            v.orientation = .vertical
            v.distribution = .fillEqually
            v.alignment = .centerX
            v.spacing = 10

            v.edgesToSuperview(insets: .uniform(30))
            v.height(300)
            v.width(700)

            [ "Show Pop Up"
            ].forEach { btn in
                v.add { (v: Button) in
                    v.bezelStyle = .rounded
                    v.title = "\(btn)"
                    v.rx.tap.asDriver()
                        .drive(onNext: {

                        })
                        .disposed(by: self.disposeBag)
                }
            }
        }

        view.wantsLayer = true
        view.layer?.backgroundColor = Color.red.cgColor
        view.add { (c: CompletionPopUpView) in
            c.height(200)
            c.width(200)
            c.leftToSuperview()
            c.bottomToSuperview()
            c.layer?.backgroundColor = Color.blue.cgColor

            c.add { (c: CompletionPopUpView) in
                c.rightToSuperview(offset: 50)
                c.topToSuperview(offset: -50)
                c.height(100)
                c.width(100)
                c.layer?.backgroundColor = Color.green.cgColor
            }
        }
    }

    // MARK: Binding

    private func startBind() {
        viewModel.output.action
            .drive()
            .disposed(by: disposeBag)

        viewModel.output.error
            .drive()
            .disposed(by: disposeBag)
    }
}
#endif

final class CompletionPopUpView: View {
    override var wantsDefaultClipping: Bool {
        return false
    }

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        wantsLayer = true
    }

    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func makeBackingLayer() -> CALayer {
        return CALayer({ (l) in
            l.backgroundColor = Color.red.cgColor
            l.masksToBounds = false
        })
    }
}
