import Foundation

protocol Clock {
    func now() -> NSDate
}

struct SystemClock: Clock {
    func now() -> NSDate {
        return NSDate()
    }
}

struct MockClock: Clock {
    let date: NSDate
    
    init(_ nsDate: String) {
        let inputFormatter = NSDateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        date = inputFormatter.dateFromString("2016-06-18")!
    }
    
    func now() -> NSDate {
        return date
    }
}

protocol UsesClock {
    var clock: Clock { get }
}