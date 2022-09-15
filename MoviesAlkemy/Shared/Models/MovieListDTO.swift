//
//  MovieListDTO.swift
//  MoviesAlkemy
//
//  Created by Jefferson Naranjo rodríguez on 14/09/22.
//

import Foundation

struct MovieListDTO: Codable {
    let results: [MoviesDTO] // results es la parte que aparece en la Api de pokemon para poder acceder a los pokemons
}
