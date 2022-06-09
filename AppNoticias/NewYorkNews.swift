import Foundation

// MARK: - NewYorkNews
struct NewYorkNews: Codable {
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
    let uri: String
    let url: String
    let id, asset_id: Int
    let source: Source
    let publishedDate: String
    let updated: String
    let section: String
    let subsection: String
    let nytdsection: String
    let adxKeywords: String
    let column: String?
    let byline: String
    let type: String
    let abstract: String
    let desFacet, orgFacet, perFacet, geoFacet: [String]
    let media: [Media]
    let etaId: Int
    
    enum CodingKeys: String, CodingKey {
        case uri
        case url
        case id, asset_id
        case source
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection, adxKeywords
        case column, byline, type, abstract
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case etaId = "eta_id"
    }
}

// MARK: - Source
struct Source: Codable {
    
}

// MARK: - Media
struct Media: Codable {
    let type: String
    let subtype: String
    let caption: String
    let copyright: String
    let approvedForSyndication: Int
    
    enum CodingKeys: String, CodingKey {
        case type
        case subtype
        case caption
        case copyright
        case approvedForSyndication = "approved_for_syndication"
    }
}

// MARK: - MediaMetadata
struct MediaMetadata: Codable {
    let url: String
    let format: String
    let height: Int
    let width: Int
}
