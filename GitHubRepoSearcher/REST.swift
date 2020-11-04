//
//  REST.swift
//  GitHubRepoSearcher
//
//  Created by Vinícius Tinajero Salomão on 27/10/20.
//

import Foundation

enum ErrorType {
    case url
    case taskError(error: Error)
    case noResponse
    case noData
    case responseStatusCode(code: Int)
    case invalidJSON
}

class REST {
    
    private static let basePath = "https://api.github.com/search/repositories?"
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = false
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        config.timeoutIntervalForRequest = 120.0
        config.httpMaximumConnectionsPerHost = 5
        return config
    }()
    
    private static let session  = URLSession(configuration: configuration)
    
    class func loadRepositories(query: String?, page: Int = 0, onComplete: @escaping ([Repository]) -> Void, onError: @escaping (ErrorType) -> Void) {
        
        let per_page = 20
        let q: String
        
        if let query = query, !query.isEmpty {
            q = "q=\(query.replacingOccurrences(of: " ", with: ""))&"
        } else {
            return
        }
        
        let urlString = basePath + q + "page=\(page)&per_page=\(per_page)"
        
        guard let url = URL(string: urlString) else {
            onError(.url)
            return
        }
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error) in
            
            if error == nil {
                
                guard let response = response as? HTTPURLResponse else {
                    onError(.noResponse)
                    return
                }
                if response.statusCode == 200 {
                    
                    guard let data = data else {return}
                    
                    do {
                        
                        let searchData = try JSONDecoder().decode(SearchData.self, from: data)
                        
//                        let repositories = try JSONDecoder().decode([Repository].self, from: data)
                        
                        onComplete(searchData.items!)
                        
                    } catch {
                        print(error.localizedDescription)
                        onError(.invalidJSON)
                    }
                    
                } else {
                    onError(.responseStatusCode(code: response.statusCode))
                }
                
                
            } else {
                onError(.taskError(error: error!))
            }
            
        }
        
        dataTask.resume()
    }

}
