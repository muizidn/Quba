//import LanguageClient
//import RxSwift
//
//public protocol LSP: class {
////    var notification: Observable<String> { get }
////    func request() -> Observable<String>
////    func send(notification: JSONRPCMessage) -> Observable<Void>
////    func send(request: JSONRPCMessage) -> Observable<CompletionResult>
//}
//
//public class SwiftLSP: LSP {
//    let client = LanguageClient()
//
//    let serverPath = "/Volumes/DATA1/IDE/sourcekit-lsp/.build/x86_64-apple-macosx/debug/sourcekit-lsp"
//    let sourcePath = "/Volumes/DATA1/muizidn/Quba"
//    let mainSwift = "/Volumes/DATA1/muizidn/Quba/main.swift"
//
//    public init() {
//        client
//            .startServer(atPath: serverPath, sourcePath: sourcePath)
//            .done { [unowned self](result) in
//                if self.client.capabilities == nil {
//                    print("Failed")
//                } else {
//                    print("Success: \(result)")
//                }
//            }.catch { e in
//                print("Error: \(e)")
//            }
//    }
//
//    public var notification: Observable<String> {
//        return sNotification.asObservable()
//    }
//    private let sNotification = PublishSubject<String>()
//
//    public func send(notification: JSONRPCMessage) -> Observable<Void> {
//
//    }
//
//    deinit {
//        // Send Shutdown to Client
//        // Send Exit to Client
//    }
//}
//
//enum LSPMessage {
//    case openTextDocumentNotification(
//        uri: String, languageId: String, version: Int, text: String)
////    case changeTextDocumentNotification()
//    caes
//    var message: RPCMessage {
//        switch self {
//        case let .openTextDocumentNotification(uri, languageId, version, text):
//            let item = TextDocumentItem(
//                uri: uri,
//                languageId: langId,
//                version: version,
//                text: text)
//            return DidOpenTextDocumentNotification(textDocument: item)
////        case let .changeTextDocumentNotification:
////            let startPos = Position(line: <#T##Int#>, character: <#T##Int#>)
////            let endPos = Position(line: <#T##Int#>, character: <#T##Int#>)
////            let range = ContentRange(start: <#T##Position#>, end: <#T##Position#>)
////
////            let rangeLength = 0
////            let text = ""
////            let changes = TextDocumentContentChangeEvent(range: <#T##ContentRange?#>, rangeLength: <#T##Int?#>, text: <#T##String?#>)
////            let doc = VersionedTextDocumentIdentifier(version: <#T##Int#>, uri: <#T##String#>)
////            let params = DidChangeTextDocumentParams(textDocument: <#T##VersionedTextDocumentIdentifier#>, contentChanges: <#T##[TextDocumentContentChangeEvent]#>)
////            return DidChangeTextDocumentNotification(params: <#T##DidChangeTextDocumentParams#>)
//        }
//    }
//}
//
//
//struct RPCMessage: JSONRPCMessage {
//    private var message: JSONRPCMessage
//
//    var method: String {
//        return message.method
//    }
//
//    var jsonrpc: String? {
//        get {
//            return message.jsonrpc
//        }
//        set {
//            message.jsonrpc = newValue
//        }
//    }
//
//    var id: String? {
//        get {
//            return message.id
//        }
//        set {
//            message.id = newValue
//        }
//    }
//
//    func encode(to encoder: Encoder) throws {
//        try message.encode(to: encoder)
//    }
//}
//
//
//
//extension SwiftLSP: LanguageClientNotificationDelegate {
//    public func receive(diagnostics: [Diagnostic]) {
//        sNotification.onNext("Notif: receive diagnostic")
//    }
//
//    public func receive(message: LogMessage) -> Bool {
//        sNotification.onNext("Notif: receive message")
//        return true
//    }
//}

// Make LSP more like Moya?
