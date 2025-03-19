//
//  RMService.swift
//  RickAndMorty
//
//  Created by Merjen Rahmedova on 19.03.2025.
//

import Foundation
/// Primary API service object to get Rick and Morty data
final class RMService{
    /// Shared singleton instance
    static let shared = RMService()
    
    /// Privatized constructor
    private init() {}
    
    /// Send RIck and Morty API Call
    /// - Parameters:
    ///  - request: Request instance
    ///  - completion: Callback with data or error
    public func execute(_ request: RMRequest, completion: @escaping () -> Void){
        
    }
}

