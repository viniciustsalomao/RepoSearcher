//
//  Repositorie.swift
//  GitHubRepoSearcher
//
//  Created by Vinícius Tinajero Salomão on 26/10/20.
//

import Foundation

struct SearchData: Decodable {
    let items: [Repository]
}

struct Repository: Decodable {
    let name: String
    let owner: Owner
    let language: String
    let stargazers_count: Int
    let html_url: String
}

struct Owner: Decodable {
    let login: String
    let avatar_url: String
}
