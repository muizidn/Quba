//
//  Rx+event.swift
//  QubaUI
//
//  Created by PondokIOS on 28/07/19.
//

import AppKit
import RxSwift
import RxCocoa

#if os(macOS)
extension Reactive where Base: NSResponder {
    var event: ControlEvent<Event> {
        let source = Observable.deferred { [unowned base] in
            return Observable.merge([ #selector(Base.keyDown(with:)),
                                      #selector(Base.keyUp(with:)), ]
                .map({ base.rx.methodInvoked($0) }))
                .map({ Event(nsEvent: $0[0] as! NSEvent) })
        }
        return ControlEvent<Event>(events: source)
    }
}
#endif
