#if DEBUG
//
//  LifetimeTrackable.swift
//  QubaUI
//
//  Created by PondokIOS on 29/07/19.
//

import Foundation

private enum LifetimeCounter {
    static var counter: [String: Int] = [:]
}

protocol LifetimeTrackable: class {
    static var maxInstanceCount: Int { get }
}

extension LifetimeTrackable {
    static var maxInstanceCount: Int {
        return 1
    }

    var key: String {
        return "\(type(of: self))"
    }

    func increment(caller: StaticString = #function) {
        assert(caller.description.contains("init("), "thisMethod must be invoked from init")
        var counter = LifetimeCounter.counter[key] ?? 0
        counter += 1
        assert(counter <= Self.maxInstanceCount, "This \(key) requires instance count to be \(Self.maxInstanceCount) but found \(counter)")
        LifetimeCounter.counter[key] = counter
        print("Increment \(key): \(counter)")
    }

    func decrement(caller: StaticString = #function) {
        assert(caller.description.contains("deinit"), "This method must be invoked from deinit")
        var counter = LifetimeCounter.counter[key] ?? 0
        counter -= 1
        LifetimeCounter.counter[key] = counter
        print("Decrement \(key): \(counter)")
    }
}
#endif
