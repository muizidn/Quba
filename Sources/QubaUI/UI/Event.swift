//
//  Event.swift
//  QubaUI
//
//  Created by PondokIOS on 28/07/19.
//

import Foundation
import AppKit

struct Event: Equatable {
    let type: EventType
    let character: String
    let keyType: KeyType
    let modifierFlag: [ModifierFlag]
}

extension Event {
    enum EventType: UInt {
        case keyDown
        case keyUp
        case unknown
    }
    enum ModifierFlag: UInt {
        case capsLock
        case shift
        case control
        case option
        case command
        case help
        case function
        case unknown
    }
    enum KeyType {
        case enter
        case backspace
        case tab
        case newLine
        case formFeed
        case carriageReturn
        case backTab
        case delete
        case lineSeparator
        case paragraphSeparator
        case other
    }
}

#if os(macOS)
extension Event {
    init(nsEvent: NSEvent) {
        self.type = EventType(type: nsEvent.type)
        self.keyType = nsEvent.keyType
        self.character = nsEvent.charactersIgnoringModifiers ?? ""
        self.modifierFlag = nsEvent.modifierFlags.asEventModifierFlags
    }
}

extension Event.EventType {
    init(type: NSEvent.EventType) {
        switch type {
        case .keyDown: self = .keyDown
        case .keyUp: self = .keyUp
        default: self = .unknown
        }
    }
}

extension NSEvent.ModifierFlags {
    var asEventModifierFlags: [Event.ModifierFlag] {
        var modifierFlags = [Event.ModifierFlag]()
        if self.contains(.capsLock) {
            modifierFlags.append(.capsLock)
        }
        if self.contains(.shift) {
            modifierFlags.append(.shift)
        }
        if self.contains(.control) {
            modifierFlags.append(.control)
        }
        if self.contains(.option) {
            modifierFlags.append(.option)
        }
        if self.contains(.command) {
            modifierFlags.append(.command)
        }
        if self.contains(.help) {
            modifierFlags.append(.help)
        }
        if self.contains(.function) {
            modifierFlags.append(.function)
        }

        return modifierFlags
    }
}

extension NSEvent {
    var keyType: Event.KeyType {
        guard let code = characters?.first?.unicodeScalars.first?.value else {
            return .other }
        switch Int(code) {
        case NSEnterCharacter: return .enter
        case NSBackspaceCharacter: return .backspace
        case NSTabCharacter: return .tab
        case NSNewlineCharacter: return .newLine
        case NSFormFeedCharacter: return .formFeed
        case NSCarriageReturnCharacter: return .carriageReturn
        case NSBackTabCharacter: return .backTab
        case NSDeleteCharacter: return .delete
        case NSLineSeparatorCharacter: return .lineSeparator
        case NSParagraphSeparatorCharacter: return .paragraphSeparator
        default: return .other
        }
    }
}

#endif
