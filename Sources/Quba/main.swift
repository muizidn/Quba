import QubaUI

let app = QubaApp()
do {
    try app.run()
} catch {
    print("Whoops: \(error.localizedDescription)")
}
