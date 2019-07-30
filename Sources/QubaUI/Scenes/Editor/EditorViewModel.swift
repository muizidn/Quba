//
//  EditorViewModel.swift
//  QubaUI
//
//  Created by PondokIOS on 27/07/19.
//

import Foundation
import RxSwift
import RxCocoa

extension EditorViewModel {
    struct Input {
        let editorString: AnyObserver<String>
        let keyDownEvent: AnyObserver<Event>
    }

    struct Output {
        let action: Driver<Void>
        let error: Driver<Error>
    }
}

final class EditorViewModel: BaseViewModel<EditorViewModel.Input, EditorViewModel.Output> {

    private let sEditorString = PublishSubject<String>()
    private let sKeyDownEvent = PublishSubject<Event>()

    private let errorTracker = ErrorTracker()

    init(navigator: EditorNavigator) {
        let input = Input(
            editorString: sEditorString.asObserver(),
            keyDownEvent: sKeyDownEvent.asObserver()
        )

        let dotCharacter = sKeyDownEvent
            .filter({ $0.character == "." })
            .flatMapLatest({ [unowned navigator] _ in
                navigator.showCompletionPopUpWindow()
            })
            .debug("CompletionPopUp")
            .mapToVoid()

        let editorTextChange = sEditorString
            .debug("Editor", trimOutput: false)
            .mapToVoid()

        let action = Observable
            .merge([
                dotCharacter,
                editorTextChange,
            ])

        let output = Output(
            action: action.asDriverOnErrorJustComplete(),
            error: errorTracker.asDriver()
        )

        super.init(input: input, output: output)
    }
}
