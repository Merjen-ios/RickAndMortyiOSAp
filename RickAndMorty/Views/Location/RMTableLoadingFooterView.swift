//
//  RMTableoadingFooterView.swift
//  RickAndMorty
//
//  Created by Merjen Rahmedova on 01.04.2025.
//

import UIKit

final class RMTableoadingFooterView: UIView {
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        return spinner
    } ()
    

    override init(frame: CGRect) {
        super .init(frame: frame )
        
        addSubview(spinner)
        spinner.startAnimating()
        
         addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    private func addConstraints(){
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 55),
            spinner.heightAnchor.constraint(equalToConstant: 55),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            self.heightAnchor.constraint(equalToConstant: 100),

        ])
    }
}
