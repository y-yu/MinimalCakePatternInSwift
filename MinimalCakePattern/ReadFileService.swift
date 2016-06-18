import Foundation

protocol ReadFileService: UsesClock, UsesLogger {
    func readWithDate(fileName: String) -> Optional<(NSDate, String)>
}

extension ReadFileService {
    func readWithDate(fileName: String) -> Optional<(NSDate, String)> {
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            
            let pathFileName = dir.stringByAppendingPathComponent(fileName)
            logger.info(pathFileName)
            
            do {
                let text = try NSString(contentsOfFile: pathFileName, encoding: NSUTF8StringEncoding)
                return (clock.now(), text as String)
            } catch {
                logger.error("fail to read the file!")
                return Optional.None
            }
        } else {
            logger.error("fail to search directory to read the file!")
            return Optional.None
        }
    }
}


struct ReadFileServiceImpl: ReadFileService {
    var clock: Clock = SystemClock()
    var logger: Logger = PrintLogger()
}

struct ReadFileServiceTest: ReadFileService {
    var clock: Clock = MockClock("2016-06-18")
    var logger: Logger = PrintLogger()
}

protocol UsesReadFileService {
    var readFileService: ReadFileService { get }
}
