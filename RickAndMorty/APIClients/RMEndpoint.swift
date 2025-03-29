//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Merjen Rahmedova on 19.03.2025.
//

import Foundation

/// Represents unique API endpoint
enum RMEndpoint: String,CaseIterable, Hashable {
    /// Endpoint to get character info
    case character
    /// Endpoint to get location  info
    case location
    /// Endpoint to get episode  info
    case episode
}
