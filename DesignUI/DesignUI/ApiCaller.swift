//
//  ApiCaller.swift
//  DesignUI
//
//  Created by Bobomurod Ergashev on 01/10/22.
//

import Foundation
struct Constants {
   static let baseUrl = "https://api.unsplash.com/photos?page=1&query=office&client_id=Ed8u9pKc6YiRbEnSFXO33Gz0JASqppgyCfjKqZXapxw"
    
}
enum APIError: Error {
    case failedTogetData
}

class APICaller {
    static let shared = APICaller()
    func getTrendingMovies(completion : @escaping (Result<String,Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseUrl)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(String.self, from: data)
                completion(.success(results))
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
            
        }
        task.resume()
    }
    
    
}
