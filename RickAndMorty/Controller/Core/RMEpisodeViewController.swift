//
//  RMEpisodeViewController.swift
//  RickAndMorty
//
//  Created by Merjen Rahmedova on 03.03.2025.
//

import UIKit

/// Controller to show and search for Episode 
final class RMEpisodeViewController: UIViewController, RMEpisodeListViewDelegate {
        
        private let episodeListView = RMEpisodeListView()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .systemBackground
            title = "Episodes"
            setUpView()
            addSearchButton()
        }
    private func addSearchButton(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapShare))
    }
    
    @objc private func didTapSearch(){
        let vc = RMSearchViewController(config: .init(type: .episode))
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
        
    
        private func setUpView(){
            episodeListView.delegate = self
            view.addSubview(episodeListView)
            NSLayoutConstraint.activate([
                episodeListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                episodeListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                episodeListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
                episodeListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ])
        }
    @objc
     private func didTapShare(){
        
    }
        
        // MARK: - RMEpisodeListViewDelegate
   
    func rmEpisodeListView(_ characterListView: RMEpisodeListView, didSelectEpisode episode: RMEpisode) {
       //Open detail controller for that episode
        let detailVC = RMEpisodeDetailViewController(url: URL(string: episode.url))
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true )
    }
}
        
        
    
    

