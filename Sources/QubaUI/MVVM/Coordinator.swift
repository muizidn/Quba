//
//  Coordinator.swift
//  QubaUI
//
//  Created by PondokIOS on 29/07/19.
//

import Foundation
import RxSwift

protocol Coordinator {
    associatedtype ResultType
    func start() -> Observable<ResultType>
}

class BaseCoordinator<ResultType>: Coordinator, LifetimeTrackable {
    init() {
        increment()
    }

    let disposeBag = DisposeBag()
    func start() -> Observable<ResultType> {
        fatalError("Not yet implemented")
    }

    func coordinate<T>(to coodinator: BaseCoordinator<T>) -> Observable<T> {
        return coodinator.start()
    }

    deinit {
        decrement()
    }
}
