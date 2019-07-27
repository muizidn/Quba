//
//  UIClasses.swift
//  QubaUI
//
//  Created by PondokIOS on 27/07/19.
//

import AppKit

#if os(macOS)
typealias Controller = MacController
typealias View = MacView

typealias ScrollView = NSScrollView
typealias RulerView = NSRulerView

typealias TextView = NSTextView

typealias AttributedString = NSAttributedString
typealias Color = NSColor
typealias Size = NSSize
#else
#endif
