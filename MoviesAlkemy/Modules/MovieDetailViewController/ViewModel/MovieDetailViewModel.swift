//
//  MovieDetailViewModel.swift
//  MoviesAlkemy
//
//  Created by Jefferson Naranjo rodríguez on 17/09/22.
//

import Foundation

class MovieDetailViewModel {
    private var service: MoviesDetailService
    private var movieURL: String
    
    init(movieURL: String, service: MoviesDetailService) {
        self.service = service
        self.movieURL = movieURL
    }
    
    func getMovie(onGetMovie: @escaping (MoviesDetailDTO) -> Void) {
        service.getMovie(urlMovie: self.movieURL) { movie in
            onGetMovie(movie)
        } onError: { error in
            print("ha ocurrido un error", error)
        }
    }
}
