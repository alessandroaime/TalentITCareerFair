import Foundation

enum Status: String {
    case positive
    case neutral
    case negative
    case unknown
}

struct Company {
    let name: String
    //var notes: String?
    var status: Status
}
