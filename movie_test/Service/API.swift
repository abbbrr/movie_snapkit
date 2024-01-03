import Foundation
import Alamofire

class API{
    static let shared = API()
    private init () {}
    
    func fetchData(complection: @escaping ([Movie]) -> Void) {
        AF.request("https://api.themoviedb.org/3/movie/popular?language=ru-US&page=3").responseDecodable(of: MovieResponse.self) { response in
            switch response.result {
            case .success(let movieResponse):
                complection(movieResponse.results)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
