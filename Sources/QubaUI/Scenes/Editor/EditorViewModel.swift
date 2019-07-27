//  
//  EditorViewModel.swift
//  QubaUI
//
//  Created by PondokIOS on 27/07/19.
//

import Foundation
import RxSwift
import RxCocoa

final class EditorViewModel: ViewModelType {
    let input: Input
    let output: Output
    
    struct Input {
        let editorString: AnyObserver<String>
    }
    struct Output {
        let action: Driver<Void>
        let error: Driver<Error>
    }
    
    private let editorString = PublishSubject<String>()
    
    private let errorTracker = ErrorTracker()
    
    init() {
        input = Input(
            editorString: editorString.asObserver()
        )
        
        let action = editorString
            .mapToVoid()
        
        output = Output(
            action: action.asDriverOnErrorJustComplete(),
            error: errorTracker.asDriver()
        )
    }
}
