//
//  MovieDetailViewController.swift
//  MoviesAlkemy
//
//  Created by Jefferson Naranjo rodríguez on 30/08/22.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController {
    
    private var service = MoviesDetailService()
    private var viewModel: MovieDetailViewModel?
    var movieURL: String = ""

    private lazy var backgroundImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.image = UIImage(named: "MoviesDetail")
        aImage.contentMode = .scaleAspectFill
        view.addSubview(aImage)
        return aImage
    }()

    private lazy var movieImage: UIImageView = {
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(aImage, aboveSubview: backgroundImage)
        return aImage
    }()
    
    private lazy var movieName: UILabel = {
       let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .white
        aLabel.font = UIFont.systemFont(ofSize: 28)
        aLabel.textAlignment = .center
        view.addSubview(aLabel)
        return aLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        self.viewModel = MovieDetailViewModel(movieURL: self.movieURL, service: self.service)
    
        self.viewModel?.getMovie(onGetMovie: { movie in
           // self.movieName = movie.name
        })
            
            /*if let sprite = pokemon.sprites.other?.home?.frontDefault, let url = URL(string: sprite) {
                self.pokemonImage.load(url: url)
            }*/
        
    }
    
    private func setupView(){
        self.title = "Movie Detail"
        self.view.backgroundColor = .white
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            movieImage.heightAnchor.constraint(equalToConstant: 140),
            movieImage.widthAnchor.constraint(equalToConstant: 140),
            movieImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            movieName.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 22),
            movieName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            movieName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
           
        ])
        
    }
    
}
