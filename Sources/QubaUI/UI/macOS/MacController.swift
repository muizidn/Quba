//
//  MacController.swift
//  Quba
//
//  Created by PondokIOS on 27/07/19.
//

import AppKit

class MacController: NSViewController, LifetimeTrackable {
    override init(nibName nibNameOrNil: NSNib.Name? = nil, bundle nibBundleOrNil: Bundle? = Bundle.main) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        increment()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = MacView()
    }

    deinit {
        decrement()
    }
}
