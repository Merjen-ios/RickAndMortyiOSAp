//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by Merjen Rahmedova on 03.03.2025.
//

import Foundation

struct RMLocation: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
