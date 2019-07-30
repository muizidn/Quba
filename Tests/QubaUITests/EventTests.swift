//
//  EventTests.swift
//  LSP
//
//  Created by PondokIOS on 28/07/19.
//

import Quick
import Nimble
import AppKit
@testable import QubaUI

final class EventTests: QuickSpec {
    override func spec() {
        #if os(macOS)
        describe("Event") {
            it("must create wrong type") {
                let nsEventTypes: [NSEvent.EventType] = [
                    .keyDown,
                    .keyUp,
                    .mouseEntered,
                ]
                let eventTypes: [Event.EventType] = [
                    .keyDown,
                    .unknown,
                    .keyUp,
                ]
                expect(nsEventTypes.map { Event.EventType(type: $0) })
                    .toNot(equal(eventTypes))
            }

            it("must create correct type") {
                let nsEventTypes: [NSEvent.EventType] = [
                    .keyDown,
                    .keyUp,
                    .mouseEntered,
                ]
                let eventTypes: [Event.EventType] = [
                    .keyDown,
                    .keyUp,
                    .unknown,
                ]
                expect(nsEventTypes.map { Event.EventType(type: $0) })
                    .to(equal(eventTypes))
            }

            it("must create wrong flag") {
                let nsFlags: [NSEvent.ModifierFlags] = [
                    .capsLock,
                    .command,
                    .control,
                    .deviceIndependentFlagsMask,
                    .shift,
                ]

                let flags: [Event.ModifierFlag] = [
                    .command,
                    .capsLock,
                    .control,
                    .shift,
                    .unknown,
                ]

                expect(nsFlags.map { Event.ModifierFlag(flag: $0) })
                    .toNot(equal(flags))
            }

            it("must create correct flag") {
                let nsFlags: [NSEvent.ModifierFlags] = [
                    .command,
                    .capsLock,
                    .control,
                    .deviceIndependentFlagsMask,
                    .shift,
                ]

                let flags: [Event.ModifierFlag] = [
                    .command,
                    .capsLock,
                    .control,
                    .unknown,
                    .shift,
                ]

                expect(nsFlags.map { Event.ModifierFlag(flag: $0) })
                    .to(equal(flags))
            }

            it("must create wrong event") {
                let nsEvent = NSEvent.keyEvent(with: .keyDown, location: .zero, modifierFlags: .command, timestamp: 0, windowNumber: 0, context: nil, characters: "a", charactersIgnoringModifiers: "a", isARepeat: false, keyCode: 0)!
                let event = Event(type: .keyUp, character: "b", modifierFlag: .capsLock)
                expect(Event(nsEvent: nsEvent)).toNot(equal(event))
            }

            it("must create correct event") {
                let nsEvent = NSEvent.keyEvent(with: .keyDown, location: .zero, modifierFlags: .command, timestamp: 0, windowNumber: 0, context: nil, characters: "a", charactersIgnoringModifiers: "a", isARepeat: false, keyCode: 0)!
                let event = Event(type: .keyDown, character: "a", modifierFlag: .command)
                expect(Event(nsEvent: nsEvent)).to(equal(event))
            }
        }
        #endif
    }

    var allTests = [
        ("spec", spec),
    ]
}
