//
//  ScrollableTextView.swift
//  QubaUI
//
//  Created by PondokIOS on 27/07/19.
//

import Foundation

final class ScrollableTextView<T: TextView>: View {
    let scrollView = ScrollView()
    let textView = T()
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        let scrollView = ScrollView()
        scrollView.borderType = .noBorder
        scrollView.hasVerticalScroller = true
        scrollView.hasHorizontalScroller = true
        scrollView.autoresizingMask = [.width, .height]

        textView.minSize = CGSize(width: 0, height: 0)
        textView.maxSize = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)

        scrollView.documentView = textView
        enableTextWrap()
        addSubview(scrollView)
    }

    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var isTextWrapEnabled = true {
        didSet {
            if isTextWrapEnabled {
                enableTextWrap()
            } else {
                disableTextWrap()
            }
        }
    }

    private func enableTextWrap() {
        textView.enclosingScrollView?.hasHorizontalScroller = false
        textView.isVerticallyResizable = true
        textView.isHorizontallyResizable = false
        textView.textContainer?.size = CGSize(width: 0, height: CGFloat.greatestFiniteMagnitude)
        textView.autoresizingMask = [.width]
        textView.textContainer?.widthTracksTextView = true
    }

    // FIXME: This one breaks!
    private func disableTextWrap() {
        textView.enclosingScrollView?.hasHorizontalScroller = true
        textView.isVerticallyResizable = true
        textView.isHorizontallyResizable = true
        textView.textContainer?.size = CGSize(
            width: CGFloat.greatestFiniteMagnitude,
            height: CGFloat.greatestFiniteMagnitude)
        textView.autoresizingMask = [.width, .height]
        #if !DEBUG
        #error("This one doesn't work")
        #endif
        textView.textContainer?.widthTracksTextView = false
    }
}
