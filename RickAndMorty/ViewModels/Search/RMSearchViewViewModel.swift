//
//  RMSearchViewViewModel.swift
//  RickAndMorty
//
//  Created by Merjen Rahmedova on 30.03.2025.
//

import Foundation

//Responsibilities
// - show seach results
// - show no results view
// - kick off API requests
final class RMSearchViewViewModel{
    
    let config: RMSearchViewController.Config
    
    init(config: RMSearchViewController.Config){
        self.config = config 
    }
}
