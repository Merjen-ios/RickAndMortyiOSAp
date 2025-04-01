//
//  RMSearchInputViewViewModel.swift
//  RickAndMorty
//
//  Created by Merjen Rahmedova on 30.03.2025.
//

import Foundation

final class RMSearchInputViewViewModel{
    private let type: RMSearchViewController.Config.`Type`
    
    enum DynamicOption: String{
        case status = "Status"
        case gender = "Gender"
        case locationType = "Location Type"
        
        var queryArgument: String{
            switch self{
            case .status: return "status"
            case .gender: return "gender"
            case .locationType: return "type"
            }
        }
        
        var choices: [String] {
            switch self {
            case .status:
                return ["Alive","Dead","Unknown"]
                
            case .gender:
                return ["Male","Female","Genderless","Unknown"]
                 
            case .locationType:
                return ["Cluster","Planet","Microverse"]

            }
        }
    }
    
    init(type: RMSearchViewController.Config.`Type`){
        self.type = type
    }
    // MARK: - Public
    
    public var hasDynamicOptions: Bool{
        switch self.type {
        case .character ,.location:
            return true
        case .episode:
            return false
        }
    }
    
    public var options: [DynamicOption]{
        switch self.type {
        case .character:
            return [.status,.gender]
        case .location:
            return [.locationType]
        case .episode:
            return []
            
        }
    }
    
    public var searchPlaceholderText: String{
        switch self.type {
        case .character:
            return "Character Name"
        case .location:
            return "Location Name"
        case .episode:
            return "Episode Title"
            
        }
    }
}
