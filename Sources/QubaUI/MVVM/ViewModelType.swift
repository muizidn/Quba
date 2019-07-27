//
//  ViewModelType.swift
//  QubaUI
//
//  Created by PondokIOS on 27/07/19.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    var input: Input { get }
    var output: Output { get }
    
}
