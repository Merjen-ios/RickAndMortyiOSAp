//
//  RMGetAllCharactersResponse.swift
//  RickAndMorty
//
//  Created by Merjen Rahmedova on 22.03.2025.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    struct Info: Codable{
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info : Info
    let results: [RMCharacter]
}
