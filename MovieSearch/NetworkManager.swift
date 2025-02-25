import Foundation

class NetworkManager {
    func fetchPopularMovies(completion: @escaping (Results?) -> Void) {
        let apiKey = "067b37432ea7b89b1ed1812e33c7f1e7"
        let urlString = "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&api_key=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("error")
                return
            } else if let resp = response as? HTTPURLResponse, resp.statusCode == 200, let responseData = data {
                do {
                    let json = try JSONDecoder().decode(Results.self, from: responseData)
                    DispatchQueue.main.async {
                        completion(json)
                    }
                } catch {
                    print("Error parsing JSON")
                }
            }
        }.resume()
    }
    
    func searchMovies(query: String, completion: @escaping (Results?) -> Void) {
        let apiKey = "067b37432ea7b89b1ed1812e33c7f1e7"
        let urlString = "https://api.themoviedb.org/3/search/movie?query=\(query)r&api_key=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("error")
                return
            } else if let resp = response as? HTTPURLResponse, resp.statusCode == 200, let responseData = data {
                do {
                    let json = try JSONDecoder().decode(Results.self, from: responseData)
                    DispatchQueue.main.async {
                        completion(json)
                    }
                } catch {
                    print("Error parsing JSON")
                }
            }
        }.resume()
    }
}
