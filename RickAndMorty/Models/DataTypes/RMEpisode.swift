//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by Merjen Rahmedova on 03.03.2025.
//

import Foundation

struct RMEpisode: Codable, RMEpisodeDataRender{
    let id: Int
    let name: String
    let air_date: String
    let episode:String
    let characters: [String]
    let url: String
    let created: String
}
