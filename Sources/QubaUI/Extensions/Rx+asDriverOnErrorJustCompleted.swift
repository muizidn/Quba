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
        return asDriver { error in
            return Driver.empty()
        }
    }
}
