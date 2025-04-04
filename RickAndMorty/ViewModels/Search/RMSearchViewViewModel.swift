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
    private var optionMap: [RMSearchInputViewViewModel.DynamicOption: String] = [:]
    private var searchText = " "
    
    private var optionMapUpdateBlock:(((RMSearchInputViewViewModel.DynamicOption,String ))-> Void)?
    
    private var searchResultHandler: ((RMSearchResultViewModel) -> Void)?
    
    private var noResultHandler: (() -> Void)?
    
    private var searchResultModel: Codable?
    // MARK: - Init
    
    init(config: RMSearchViewController.Config){
        self.config = config
    }
    // MARK: - Public
    
    public func registerSearchResultHandler(_ block: @escaping(RMSearchResultViewModel) -> Void){
        self.searchResultHandler = block
    }
    
    public func registerNoSearchResultHandler(_ block: @escaping() -> Void){
        self.noResultHandler = block
    }
    public func executeSearch() {
        guard !searchText.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        var queryParams: [URLQueryItem] = [
            URLQueryItem(name: "name", value: searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))
        ]
        queryParams.append(contentsOf: optionMap.enumerated().compactMap({ _, element in
            let key: RMSearchInputViewViewModel.DynamicOption = element.key
            let value: String = element.value
            return URLQueryItem(name: key.queryArgument, value: value)
        }))
        
        let request = RMRequest(
            endpoint: config.type.endpoint,
            queryParameters: queryParams
        )
        switch config.type.endpoint {
        case .character:
            makeSearchAPICall(RMGetAllCharactersResponse.self, request: request)
        case .episode:
            makeSearchAPICall(RMGetAllEpisodesResponse.self, request: request)
        case .location:
            makeSearchAPICall(RMGetAllLocationsResponse.self, request: request)
       
        }
        
    }
    
    private func makeSearchAPICall<T: Codable>(_ type: T.Type, request: RMRequest){
        RMService.shared.execute(request, expecting: type) { [weak self]result in
            switch result {
            case .success(let model):
                self?.processSearchResults(model: model)
            case .failure:
                self? .handleNoResults()
                break
            }
        }
    }
    private func processSearchResults(model: Codable ){
        var resultsVM: RMSearchResultType?
        var nextUrl: String?
        if let characterResults = model as? RMGetAllCharactersResponse {
            resultsVM = .characters(characterResults.results.compactMap({
                return RMCharacterCollectionViewCellViewModel(
                    characterName: $0.name,
                    characterStatus: $0.status,
                    characterImageUrl: URL(string: $0.image)
                )
            }))
            nextUrl = characterResults.info.next
        }
        if let episodesResults = model as? RMGetAllEpisodesResponse {
            resultsVM = .episodes(episodesResults.results.compactMap({
                return RMCharacterEpisodeCollectionViewCellViewModel(
                    episodeDataUrl: URL(string: $0.url)
                    )
            }))
            nextUrl = episodesResults.info.next

        }
        if let locationsResults = model as? RMGetAllLocationsResponse {
                resultsVM = .locations(locationsResults.results.compactMap({
                    return RMLocationTableViewCellViewModel(location: $0)
                }))
            nextUrl = locationsResults.info.next

        }
            if let results = resultsVM{
                self.searchResultModel = model
                let vm = RMSearchResultViewModel(results: results, next: nextUrl)
                self.searchResultHandler?(vm)
            } else {
                handleNoResults()
            }
    }
    
    private func handleNoResults() {
        noResultHandler?()
    }
    
    public func set(query text: String){
        self.searchText = text
    }
    
    public func set(value: String, for option: RMSearchInputViewViewModel.DynamicOption ){
        optionMap[option] = value
        let tuple = (option, value)
        optionMapUpdateBlock?(tuple )
    }
    public func registerOptionChangeBlock(
        _ block: @escaping((RMSearchInputViewViewModel.DynamicOption,String ))-> Void
    ){
        self.optionMapUpdateBlock = block
    }
    public func locationSearchResult(at index: Int) -> RMLocation?{
        guard let searchModel = searchResultModel as? RMGetAllLocationsResponse else{
            return nil
        }
        
        return searchModel.results[index]
    }
}
