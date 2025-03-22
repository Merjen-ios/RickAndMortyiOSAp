//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Merjen Rahmedova on 22.03.2025.
//

import Foundation

struct CharacterListViewViewModel{
    func fetchCharacters(){
        RMService.shared.execute(.listCharactersRequests,
                                 expecting: RMGetAllCharactersResponse.self) { result  in
            switch result {
            case.success(let model):
                print("Total: "+String (model.info.count))
                print("Page result count : "+String(model.results.count))
            case.failure(let error):
                print (String(describing: error))
            }
        }
    }
}
