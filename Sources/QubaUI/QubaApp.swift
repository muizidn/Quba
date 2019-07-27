import AppKit

public protocol App {
    func run() throws
}

public class QubaApp: App {
    let app: App
    public init() {
        #if os(macOS)
        app = MacApp()
        #else
        #error("Linux?")
        #endif
    }
    public func run() throws {
        try app.run()
    }
}
