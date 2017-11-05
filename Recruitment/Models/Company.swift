import Foundation

var absoluteIndexPath: IndexPath = []

enum Status: String, Codable {
    case positive
    case neutral
    case negative
    case unknown
}

struct Company: Codable {
    let name: String
    var notes: String?
    var status: String
}

let path = Bundle.main.path(forResource: "Companies", ofType: "json")
let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)
let jsonDecoder = JSONDecoder()
var companies = try? jsonDecoder.decode(Array<Company>.self, from: jsonData)

func updateJSON() {
    let jsonEncoder = JSONEncoder()
    jsonEncoder.outputFormatting = .prettyPrinted
    let backToJson = try! jsonEncoder.encode(companies)
    let jsonString = String(data: backToJson, encoding: .utf8)
    print(jsonString!)
}
