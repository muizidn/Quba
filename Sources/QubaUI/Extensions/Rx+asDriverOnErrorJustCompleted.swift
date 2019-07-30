//
//  Rx+asDriverOnErrorJustCompleted.swift
//  QubaUI
//
//  Created by PondokIOS on 27/07/19.
//

import RxSwift
import RxCocoa

extension ObservableType {
    func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver { _ in
            return Driver.empty()
        }
    }
}
