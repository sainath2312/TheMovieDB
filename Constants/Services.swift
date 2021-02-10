//
//  Services.swift
//  TheMovieDB
//
//  Created by Sainath Gajavada on 09/02/21.
//

import Foundation
import UIKit
import Reachability
import Foundation
import UIKit

struct APIService {
    
    let baseURL = URL(string: "https://api.themoviedb.org/3/movie/")!
    static let shared = APIService()
    let decoder = JSONDecoder()
    
    enum APIError: Error {
        
        case noResponse
        case jsonDecodingError(error: Error)
        case networkError(error: Error)
        case internetError(error: Error)
        case invalidEndpoint
        case unAuthorized

       }
    
    enum Endpoint {
        case topRated
        case upcoming

        func path() -> String {
            switch self {
            case .topRated:
                return "top_rated"
            case .upcoming:
                return "upcoming"
            }
        }
    }
//MARK : - GET REQUEST
    func GET<T: Codable>(endpoint: Endpoint, queryItems:[String:String], headers:[String:String], completionHandler: @escaping (Result<T, APIError>) -> Void) {
        
        if  !Reachability().isNetworkAvailable()
        {
            let error = NSError(domain: "No Internet", code: 404, userInfo: [:])
            completionHandler(.failure(.internetError(error: error)))
        } else {
        
            
            let requestURL = baseURL.appendingPathComponent(endpoint.path())
            
            guard var urlComponents = URLComponents(url: requestURL, resolvingAgainstBaseURL: true) else {
                completionHandler(.failure(.invalidEndpoint))
                return
            }
            urlComponents.queryItems = queryItems.map { URLQueryItem(name: $0, value: $1) }
            
            guard let url = urlComponents.url else {
                completionHandler(.failure(.invalidEndpoint))
                return
            }
            
            let config = URLSessionConfiguration.default
            config.httpAdditionalHeaders = headers
            
            let session = URLSession(configuration: config)
            
            let task = session.dataTask(with: url) { data, res, error in
                
                
                guard let statusCode = (res as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completionHandler(.failure(.networkError(error: error!)))
                    return
                }
                
                guard let data = data else {
                    DispatchQueue.main.async {
                        completionHandler(.failure(.noResponse))
                    }
                    return
                }
                guard error == nil else {
                    DispatchQueue.main.async {
                        completionHandler(.failure(.networkError(error: error!)))
                    }
                    return
                }

                do {
                    let object = try self.decoder.decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completionHandler(.success(object))
                    }
                } catch let error {
                    DispatchQueue.main.async {
                        #if DEBUG
                        print("JSON Decoding Error: \(error)")
                        #endif
                        completionHandler(.failure(.jsonDecodingError(error: error)))
                    }
                }
                
            }
            task.resume()
            
        }
        
    }
    
}
