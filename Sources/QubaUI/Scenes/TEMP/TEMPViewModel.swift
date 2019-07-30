#if DEBUG
//
//  TEMPViewModel.swift
//  QubaUI
//
//  Created by PondokIOS on 28/07/19.
//

import Foundation
import RxSwift
import RxCocoa
import LSP

enum LSPRequest {
    case openAndDiagnostic
    case codeCompletionHasResult
    case methodCompletion
    case badOffsetDontCrash
}

final class TEMPViewModel: ViewModelType {
    let input: Input
    let output: Output

    struct Input {
    }

    struct Output {
        let action: Driver<Void>
        let error: Driver<Error>
     }

    private let errorTracker = ErrorTracker()

    init() {
        input = Input()
        output = Output(
            action: .empty(),
            error: errorTracker.asDriver()
        )
    }
}

#endif
