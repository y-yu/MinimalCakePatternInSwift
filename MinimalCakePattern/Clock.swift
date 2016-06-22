import Foundation

protocol Clock {
    func now() -> NSDate
}

struct MixInSystemClock: Clock {
    func now() -> NSDate {
        return NSDate()
    }
}

struct MixInMockClock: Clock {
    let date: NSDate
    
    init(_ str: String) {
        let inputFormatter = NSDateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        date = inputFormatter.dateFromString(str)!
    }
    
    func now() -> NSDate {
        return date
    }
}

protocol UsesClock {
    var clock: Clock { get }
}