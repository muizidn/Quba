//
//  CompletionPopUpViewModel.swift
//  QubaUI
//
//  Created by PondokIOS on 29/07/19.
//

import Foundation
import RxSwift
import RxCocoa

extension CompletionPopUpViewModel {
    struct Input {
        let requestCompletion: AnyObserver<Void>
    }

    struct Output {
        let selectedCompletion: Driver<String>
        let error: Driver<Error>
    }
}

final class CompletionPopUpViewModel: BaseViewModel<CompletionPopUpViewModel.Input, CompletionPopUpViewModel.Output> {

    private let sRequestCompletion = PublishSubject<Void>()
    private let errorTracker = ErrorTracker()

    init() {
        let input = Input(
            requestCompletion: sRequestCompletion.asObserver()
        )

        let selectedCompletion = sRequestCompletion
            .flatMapLatest({ Observable.just("func keyboard() { }") })
            .trackError(errorTracker)

        let output = Output(
            selectedCompletion: selectedCompletion.asDriverOnErrorJustComplete(),
            error: errorTracker.asDriver()
        )
        super.init(input: input, output: output)
    }
}
