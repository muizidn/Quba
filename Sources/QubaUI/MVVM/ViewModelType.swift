//
//  ViewModelType.swift
//  QubaUI
//
//  Created by PondokIOS on 27/07/19.
//

import Foundation

protocol ViewModelType {
    associatedtype InputType
    associatedtype OutputType
    var input: InputType { get }
    var output: OutputType { get }
}

class BaseViewModel<I, O>: ViewModelType, LifetimeTrackable {
    let input: I
    let output: O

    /// BaseViewModel initializer
    /// This supposed to be designated initializer
    /// for subclass
    ///
    /// - Parameters:
    ///   - input: instance of Input type
    ///   - output: instance of Output type
    init(input: I, output: O) {
        self.input = input
        self.output = output
        increment()
    }

    deinit { decrement() }
}
