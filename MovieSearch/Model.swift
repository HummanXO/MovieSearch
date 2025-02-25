import Foundation

struct Results: Codable {
    var results: [Movie]
}

struct Movie: Codable {
    var title: String
    var overview: String
    var release_date: String
    var poster_path: String
    
    var posterURL: URL? {
        return URL(string: "https://image.tmdb.org/t/p/w500\(poster_path)")
    }
}
