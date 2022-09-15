//
//  MovieListViewModel.swift
//  MoviesAlkemy
//
//  Created by Jefferson Naranjo rodríguez on 14/09/22.
//

import Foundation

class MovieListViewModel {
    
    private var service: MovieListService
    var movies = [MoviesDTO]()
            
    
    init(service: MovieListService){
        self.service = service
    }
    
    func getMovies(onComplete: @escaping () ->  Void) {
        service.getMovies { results in
            self.movies = results
            onComplete()
        } onError: { error in
            print(error)
        }

    }
}
