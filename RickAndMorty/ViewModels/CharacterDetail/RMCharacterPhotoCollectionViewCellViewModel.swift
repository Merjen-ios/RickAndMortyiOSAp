//
//  RMCharacterPhotoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Merjen Rahmedova on 25.03.2025.
//

import Foundation

final class RMCharacterPhotoCollectionViewCellViewModel{
    private let imageUrl: URL?
    
    init(imageUrl: URL?){
        self.imageUrl = imageUrl
    }
    
    public func fetchImage(completion: @escaping(Result<Data, Error>) -> Void){
        guard let imageUrl = imageUrl else{
            completion(.failure(URLError.badURL as! Error))
            return
        }
        RMImageLoader.shared.downloadImage(imageUrl, completion: completion)
    }
}
