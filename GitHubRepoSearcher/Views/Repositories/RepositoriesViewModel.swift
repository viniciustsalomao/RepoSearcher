//
//  RepositoriesViewModel.swift
//  GitHubRepoSearcher
//
//  Created by Vinícius Tinajero Salomão on 27/10/20.
//

import Foundation

class RepositoriesViewModel {
    
    var page = 0
    
    func loadRepositories(query: String?, onComplete: @escaping ([Repository]) -> Void, onError: @escaping (ErrorType) -> Void) {
        if query == nil {
            page = 0
        } else {
            page += 1
        }
        
        REST.loadRepositories(query: query, page: page) { (repositories) in
            onComplete(repositories)
        } onError: { (error) in
            onError(error)
        }

    }
}
