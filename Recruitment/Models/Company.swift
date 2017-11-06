import Foundation

var companies: Array<Company> = []

enum Status: String, Codable {
    case positive
    case neutral
    case negative
    case unknown
}

struct Company: Codable {
    let name: String
    var status: String
}

func readJSON() {
    let path = Bundle.main.path(forResource: "Companies", ofType: "json")
    let jsonData = try! Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)
    let jsonDecoder = JSONDecoder()
    companies = try! jsonDecoder.decode(Array<Company>.self, from: jsonData)
}

func writeJSON() {
    let jsonEncoder = JSONEncoder()
    jsonEncoder.outputFormatting = .prettyPrinted
    let backToJson = try! jsonEncoder.encode(companies)
    let jsonString = String(data: backToJson, encoding: .utf8)
    let path = Bundle.main.path(forResource: "Companies", ofType: "json")
    do {
      try jsonString?.write(to: URL(fileURLWithPath: path!), atomically: false, encoding: .utf8)
    } catch {}
}
