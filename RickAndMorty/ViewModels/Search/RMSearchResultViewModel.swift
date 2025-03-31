//
//  RMSearchResultViewModel.swift
//  RickAndMorty
//
//  Created by Merjen Rahmedova on 31.03.2025.
//

import Foundation

enum RMSearchResultViewModel  {
    case characters([RMCharacterCollectionViewCellViewModel])
    case episodes([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
