import Foundation

protocol MainService: UsesReadFileService {
    func main() -> Void
}

extension MainService {
    func main() -> Void {
        let opt = readFileService.readWithDate("test.txt")
        _ = opt.map({(f: (NSDate, String)) -> Void in
            print(f.0)
            print(f.1)
        })
    }
}

struct MainServiceImpl: MainService {
    var readFileService: ReadFileService = ReadFileServiceImpl()
}

MainServiceImpl().main()
