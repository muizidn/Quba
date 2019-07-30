//  ___FILEHEADER___

import Foundation
import RxSwift
import RxCocoa

final class ___VARIABLE_productName: identifier___ViewModel: ViewModelType {
    let input: Input
    let output: Output

    struct Input { }

    struct Output {
        let error: Driver<Error>
     }

    private let errorTracker = ErrorTracker()

    init() {
        input = Input()

        output = Output(
            error: errorTracker.asDriver()
        )
    }
}
