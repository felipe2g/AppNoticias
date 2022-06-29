//
//  NetworkManager.swift
//  AppNoticias
//
//  Created by Felipe Augusto Guimaraes Gomes Sousa on 29/06/22.
//

import Foundation

enum ResultNewsError: Error {
    case badURL, noData, invalidJSON
}

class NetworkManager {
    static let shared = NetworkManager()
    
    struct Constants {
        static let newsAPI = URL(string: "https://ebac-webservice.herokuapp.com/home")
    }
    
    private init() { }
    
    func getNews(completion: @escaping (Result<[ResultNews], ResultNewsError>) -> Void) {
        // Setup the url
        guard let url = Constants.newsAPI else {
            completion(.failure(.badURL))
            return
        }
        
        // Create a configuration
        let configuration = URLSessionConfiguration.default
        
        // Create a session
        let session = URLSession(configuration: configuration)
        
        // Create the task
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data else {
                completion(.failure(.invalidJSON))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(ResponseNews.self, from: data)
                completion(.success(result.results))
            } catch {
                print("Error info: \(error.localizedDescription)")
                completion(.failure(.noData))
            }
        }
        
        task.resume()
    }
}
