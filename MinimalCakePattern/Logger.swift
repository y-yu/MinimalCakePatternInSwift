protocol Logger {
    func info(m: String) -> Void
    
    func error(m: String) -> Void
}

class MixInPrintLogger: Logger {
    func info(m: String) -> Void {
        print("Info: " + m)
    }
    
    func error(m: String) -> Void {
        print("Error: " + m)
    }
}

protocol UsesLogger {
    var logger: Logger { get }
}
