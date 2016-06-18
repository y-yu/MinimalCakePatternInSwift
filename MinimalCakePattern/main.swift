import Foundation

protocol Main: UsesReadFileService {
    func main() -> Void
}

extension Main {
    func main() -> Void {
        let opt = readFileService.readWithDate("test.txt")
        _ = opt.map({(f: (NSDate, String)) -> Void in
            print(f.0)
            print(f.1)
        })
    }
}

struct MainImpl: Main {
    var readFileService: ReadFileService = ReadFileServiceImpl()
}

MainImpl().main()
