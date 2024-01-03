import Foundation

struct MovieResponse: Decodable {
    let page: Int
    let results: [Movie]
}

struct Movie: Decodable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String
    let poster_path:String
    let vote_average:Float

    enum CodingKeys: String, CodingKey {
        case id, title, overview, releaseDate = "release_date", poster_path = "poster_path", vote_average = "vote_average"
    }
}
