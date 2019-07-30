//
//  Rx+trackError.swift
//  QubaUI
//
//  Created by PondokIOS on 28/07/19.
//

import Foundation
import RxSwift

extension ObservableConvertibleType {
    func trackError(_ tracker: ErrorTracker) -> Observable<Element> {
        return tracker.trackError(from: self)
    }
}
