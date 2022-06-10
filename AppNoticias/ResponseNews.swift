import Foundation

// MARK: - NewYorkNews
struct ResponseNews: Codable {
    let status, copyright: String
    let numResults: Int
    let results: [ResultNews]
    
    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}

// MARK: - ResultNews
struct ResultNews: Codable {
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case title
    }
}
