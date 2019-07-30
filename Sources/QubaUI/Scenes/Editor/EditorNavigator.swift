//
//  EditorNavigator.swift
//  QubaUI
//
//  Created by PondokIOS on 29/07/19.
//

import AppKit
import RxSwift

protocol EditorNavigator: class {
    func showCompletionPopUpWindow() -> Observable<String>
}
