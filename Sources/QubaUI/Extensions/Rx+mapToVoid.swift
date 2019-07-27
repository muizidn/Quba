//
//  Rx+mapToVoid.swift
//  QubaUI
//
//  Created by PondokIOS on 27/07/19.
//

import Foundation
import RxCocoa
import RxSwift

extension ObservableConvertibleType {
    func mapToVoid() -> Observable<Void> {
        return asObservable().map({ _ in })
    }
}

extension SharedSequenceConvertibleType {
    func mapToVoid() -> SharedSequence<SharingStrategy,Void> {
        return asSharedSequence().map({ _ in })
    }
}
