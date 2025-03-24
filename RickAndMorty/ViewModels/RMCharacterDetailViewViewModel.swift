//
//  RMCharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Merjen Rahmedova on 23.03.2025.
//

import Foundation

final class RMCharacterDetailViewViewModel{
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character =  character
    }
    public var title: String{
        character.name.uppercased()
    }
}
